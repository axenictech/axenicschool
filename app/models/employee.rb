# Employee
class Employee < ActiveRecord::Base
  belongs_to :employee_category
  belongs_to :employee_position
  belongs_to :employee_grade
  belongs_to :employee_department
  belongs_to :nationality, class_name: 'Country'
  belongs_to :user
  belongs_to :reporting_manager, class_name: 'Employee'
  has_attached_file :image
  validates_attachment_content_type \
  :image, content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']

  has_many :employees_subjects
  has_many :subjects, through: :employees_subjects
  has_many :timetable_entries
  has_many :employee_bank_details
  has_many :employee_additional_details
  has_many :apply_leaves
  has_many :monthly_payslips
  has_many :employee_salery_structures
  has_many :finance_transactions, as: :payee
  has_many :employee_attendances
  has_many :individual_payslip_categories
  after_save :create_user_account

  validates :email, presence: true, format: \
  { with: /\A[a-zA-Z0-9._-]+@([a-zA-Z0-9]+\.)+[a-zA-Z]{2,4}+\z/ }
  validates :first_name, presence: true, length: \
  { minimum: 1, maximum: 20 }, format: \
  { with: /\A[a-zA-Z_" "-]+\Z/, message: 'allows only letters' }
  validates :middle_name, length: { minimum: 1, maximum: 20 }, format: \
  { with: /\A[a-zA-Z_" "-]+\Z/,\
    message: 'allows only letters' }, allow_blank: true
  validates :last_name, presence: true, length: \
  { minimum: 1, maximum: 20 }, format: \
  { with: /\A[a-zA-Z_" "-]+\Z/, message: 'allows only letters' }
  validates :email, format: \
  { with: /\A[a-zA-Z0-9._-]+@([a-zA-Z0-9]+\.)+[a-zA-Z]{2,4}+\z/ \
   }, allow_blank: true

  validates :date_of_birth, presence: true
  validates :employee_department, presence: true
  validates :employee_category, presence: true
  validates :employee_position, presence: true
  validates :employee_grade, presence: true
  validates :qualification, length: \
  { minimum: 1, maximum: 30 }, allow_blank: true
  validates :experience_detail, length: \
  { minimum: 1, maximum: 30 }, allow_blank: true
  validates :father_name, length: \
  { minimum: 1, maximum: 20 }, format: \
  { with: /\A[a-z A-Z_" "-]+\Z/, message: 'allows only letters' \
    }, allow_blank: true
  validates :mother_name, length: \
   { minimum: 1, maximum: 20 }, format: \
   { with: /\A[a-z A-Z " "-]+\Z/, message: 'allows only letters' \
    }, allow_blank: true

  validates :home_address_line1, presence: true, length: \
   { in: 1..30 }, on: :update
  validates :home_address_line2, length: \
  { in: 1..30 }, allow_blank: true
  validates :home_city, presence: true, format: \
   { with: /\A[a-z A-Z]+\z/, message: 'only allows letters' \
   }, length: { in: 1..30 }, on: :update
  validates :home_state, presence: true, format: \
   { with: /\A[a-z A-Z]+\z/, message: 'only allows letters' \
    }, length: { in: 1..30 }, on: :update
  validates :home_pin_code, presence: true, numericality: \
  { only_integer: true }, length: \
  { minimum: 6, maximum: 6 }, on: :update
  validates :office_address_line1, length: \
  { in: 1..30 }, allow_blank: true
  validates :office_address_line2, length: { in: 1..30 }, allow_blank: true
  validates :office_city, format: \
  { with: /\A[a-z A-Z]+\z/, message: 'only allows letters' },
                          length: { in: 1..30 }, allow_blank: true
  validates :office_state, format: \
  { with: /\A[a-z A-Z]+\z/, message: 'only allows letters' },
                           length: { in: 1..30 }, allow_blank: true
  validates :office_pin_code, numericality: { only_integer: true }, length: \
  { minimum: 6, maximum: 6 \
                    }, allow_blank: true
  validates :office_phone1, numericality: { only_integer: true }, length: \
  { minimum: 6, maximum: 11 }, allow_blank: true
  validates :office_phone2, numericality: { only_integer: true }, length: \
  { minimum: 6, maximum: 11 }, allow_blank: true
  validates :mobile_phone, numericality: { only_integer: true }, length: \
  { minimum: 10, maximum: 10 }, allow_blank: true
  validates :fax, numericality: { only_integer: true }, length: \
  { minimum: 6, maximum: 11 }, allow_blank: true
  validates :home_phone, numericality: { only_integer: true }, length: \
  { minimum: 6, maximum: 11 }, allow_blank: true

  validates :home_country_id, presence: true, on: :update
  scope :shod, ->(id) { where(id: id).take }
  scope :not_status, -> { where(status: false).order(:name) }
  scope :search1, ->(other_conditions, param)\
   { where('first_name like ?' + other_conditions, param + '%') }

  def archived_employee
    employee_attributes = attributes
    update_attributes(status_description: status)
    employee_attributes['former_id'] = id
    archived_employee = ArchivedEmployee.create(employee_attributes)
    archived_employee
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def update_payroll(payroll_id, amount)
    @payrolls = PayrollCategory.where(payroll_category_id: payroll_id)
    unless @payrolls.nil?
      @payrolls.each do |payrol|
        p_amount = (amount.to_f * payrol.percentage.to_f) / 100
        @payroll_salary = EmployeeSaleryStructure.where(employee_id: id, payroll_category_id: payrol.id).take
        if @payroll_salary.nil?
          EmployeeSaleryStructure.create(employee_id: id, payroll_category_id: payrol.id, amount: p_amount)
        else
          @payroll_salary.update(amount: p_amount)
        end
        update_payroll(payrol.id, p_amount)
      end
    end
  end

  def assign(batch, id)
    if batch.employee_id.blank?
      assigned_emps = []
    else
      assigned_emps = batch.employee_id.split(',')
    end
    assigned_emps.push(id.to_s)
    batch.update employee_id: assigned_emps.join(',')
    assigned_emps.join(',')
  end

  def remove(batch, id)
    assigned_emps = batch.employee_id.split(',')
    assigned_emps.delete(id.to_s)
    assign_employees = assigned_emps.join(',')
    batch.update employee_id: assign_employees
    assign_employees
  end

  def emp_no
    date = Date.today.strftime('%Y%m%d')
    self.employee_number = date.to_s + '1' if Employee.first.nil?
    self.employee_number = date.to_s + \
      Employee.last.employee_number.next.to_s unless Employee.first.nil?
  end

  def self.search2(a, s)
    unless s.empty?
      dep_id = a[:employee_department_id]
      cat_id = a[:employee_category_id]
      pos_id = a[:employee_position_id]
      grd_id = a[:employee_grade_id]
      other_conditions = ''
      other_conditions += " AND employee_department_id = '#{dep_id}'" unless dep_id == ''
      other_conditions += " AND employee_category_id = '#{cat_id}'" unless cat_id == ''
      other_conditions += " AND employee_position_id = '#{pos_id}'" unless pos_id == ''
      other_conditions += " AND employee_grade_id = '#{grd_id}'" unless grd_id == ''
      Employee.search1(other_conditions, s)
  end
  end

  def self.adv_search(p)
    conditions = ''
    conditions += "concat_ws(' ',first_name,last_name) like '#{p[:name]}%'" unless p[:name] == ''

    if p[:gender]
      unless p[:gender].eql? 'All'
        if conditions == ''
          conditions += "gender like '#{p[:gender]}'"
        else
          conditions += " AND gender like '#{p[:gender]}'"
        end
      end
    end

    if p[:employee_category_id]
      if conditions == ''
        conditions += "employee_category_id = #{p[:employee_category_id]}" unless p[:employee_category_id] == ''
      else
        conditions += " AND employee_category_id = #{p[:employee_category_id]}" unless p[:employee_category_id] == ''
      end
    end

    if p[:blood_group]
      if conditions == ''
        conditions += "blood_group like '#{p[:blood_group]}'" unless p[:blood_group] == ''
      else
        conditions += " AND blood_group like '#{p[:blood_group]}'" unless p[:blood_group] == ''
      end
    end

    if p[:marital_status]
      if conditions == ''
        conditions += "marital_status like '#{p[:marital_status]}'" unless p[:marital_status] == ''
      else
        conditions += " AND marital_status like '#{p[:marital_status]}'" unless p[:marital_status] == ''
      end
    end

    if p[:country_id]
      if conditions == ''
        conditions += "country_id='#{p[:country_id]}'" unless p[:country_id] == ''
      else
        conditions += " AND country_id ='#{p[:country_id]}'" unless p[:country_id] == ''
      end
    end

    if p[:joining_date]
      if conditions == ''
        conditions += "joining_date='#{p[:joining_date]}'" unless p[:joining_date] == ''
      else
        conditions += " AND joining_date ='#{p[:joining_date]}'" unless p[:joining_date] == ''
      end
    end

    if p[:employee_department_id]
      if conditions == ''
        conditions += "employee_department_id='#{p[:employee_department_id]}'" unless p[:employee_department_id] == ''
      else
        conditions += " AND employee_department_id='#{p[:employee_department_id]}'" unless p[:employee_department_id] == ''
      end
    end

    if p[:employee_position_id]
      if conditions == ''
        conditions += "employee_position_id='#{p[:employee_position_id]}'" unless p[:employee_position_id] == ''
      else
        conditions += " AND employee_position_id='#{p[:employee_position_id]}'" unless p[:employee_position_id] == ''
      end
     end

    if p[:employee_grade_id]
      if conditions == ''
        conditions += "employee_grade_id='#{p[:employee_grade_id]}'" unless p[:employee_grade_id] == ''
      else
        conditions += " AND employee_grade_id='#{p[:employee_grade_id]}'" unless p[:employee_grade_id] == ''
      end
    end

    if p[:date_of_birth]
      if conditions == ''
        conditions += "date_of_birth='#{p[:date_of_birth]}'" unless p[:date_of_birth] == ''
      else
        conditions += " AND date_of_birth ='#{p[:date_of_birth]}'" unless p[:date_of_birth] == ''
      end
    end

    if status = p[:status]

      if p[:status] == 'all'
        @employee1 = Employee.includes(:employee_department).where(conditions)
        @employee2 = ArchivedEmployee.includes(:employee_department).where(conditions)
        @employees = @employee1 + @employee2
      elsif p[:status] == 'present'
        @employees = Employee.includes(:employee_department).where(conditions)
      else
        @employees = ArchivedEmployee.includes(:employee_department).where(conditions)
      end
    end
    @employees
  end

  def self.adv_search2(p)
    search = ''
    search += ' Name: ' + p[:name].to_s + ', ' unless p[:name].empty?

    if  p[:gender] == 'All'
      search += ' Gender: All' + ', '
    else
      search += ' Gender: ' + p[:gender].to_s + ', ' unless p[:gender].empty?
    end

    search += ' Blood group: ' + p[:blood_group].to_s + ', ' unless p[:blood_group].empty?
    search += ' Marital Status: ' + p[:marital_status].to_s + ', ' unless p[:marital_status].empty?

    if p[:country_id].present?
      search += ' Country: ' + Country.find(p[:country_id]).name + ', '
    end

    if p[:employee_category_id].present?
      search += ' Category: ' + EmployeeCategory.find(p[:employee_category_id]).name + ', '
    end

    search += 'Joining date:' +  p[:joining_date].to_s + ', ' unless  p[:joining_date].empty?

    if p[:employee_department_id].present?
      search += ' Department: ' + EmployeeDepartment.find(p[:employee_department_id]).name + ', '
     end

    if p[:employee_position_id].present?
      search += ' Position: ' + EmployeePosition.find(p[:employee_position_id]).name + ', '
     end

    if p[:employee_grade_id].present?
      search += ' Grade: ' + EmployeeGrade.find(p[:employee_grade_id]).name + ', '
     end

    search += ' Date of birth: ' +  p[:date_of_birth].to_s + ', ' unless  p[:date_of_birth].empty?

    if p[:status] == 'present'
      search += 'Staus: Present student'
    elsif p[:status] == 'former'
      search += 'Staus: Former student'
    else
      search += ' Status: All student'
    end
    search
  end

  def self.one_click(employees, already_created, salary_date)
    employees.pluck(:id)
    employees.each do |emp|
      if already_created.include? emp.id

      else
            counter = 0
            tot = 0
            tot_deduction = 0
            grand_tot = 0
            no_deduction = PayrollCategory.where(is_deduction:false)
            no_deduction.each do |j|
            amount = EmployeeSaleryStructure.where(employee_id: emp.id, payroll_category_id: j).pluck(:amount)
            amount.each do |i|
              tot += i.to_f
            end
            end 
            is_deduction = PayrollCategory.where(is_deduction:true)
            is_deduction.each do |i|
              amount = EmployeeSaleryStructure.where(employee_id: emp.id, payroll_category_id: i).pluck(:amount)
              amount.each do  |j|
                tot_deduction += j.  to_f
              end
            end

            grand_tot = tot - tot_deduction
    
            MonthlyPayslip.create(employee_id: emp.id, amount: grand_tot, is_approved: false, salary_date: salary_date)
            counter += 1
      end
    end
  end

  def create_payslip(employee, salary_date)
    start_date = salary_date - ((salary_date.day - 1).days)
    end_date = start_date + 1.month
    payslip_exists = employee.monthly_payslips.where(salary_date: start_date..end_date).take
    total_salary = 0
    tot_deduction = 0
    amounts = []
    is_deduction = PayrollCategory.where(is_deduction:true)
    is_deduction.each do |i|
      amounts = EmployeeSaleryStructure.where(employee_id: employee.id, payroll_category_id:i).pluck(:amount)
      amounts.each do |j|
        tot_deduction += j.to_f
      end
    end

    amo = []
    is_deduction = PayrollCategory.where(is_deduction:false)
    is_deduction.each do |i|
      amo = EmployeeSaleryStructure.where(employee_id: employee.id, payroll_category_id:i).pluck(:amount)
      amo.each do |j|
        total_salary += j.to_f
      end
    end
  
    total_salary -= tot_deduction.to_f
    b = MonthlyPayslip.where(employee_id: employee.id, salary_date: salary_date).pluck(:salary_date)
    if b[0].present?
      if b[0] == salary_date.strftime('%b')
        flag = 1
    end
    else
      MonthlyPayslip.create(salary_date: salary_date, employee_id: employee.id, amount: total_salary)
      flag = 0
       end
       flag
  end

  def self.emp(emp, payroll, amount)
    salary = EmployeeSaleryStructure.where(employee_id: emp.id, payroll_category_id: payroll).take
    if salary.nil?
      EmployeeSaleryStructure.create(employee_id: emp.id, payroll_category_id: payroll, amount: amount)
    else
      salary.update(amount: amount)
    end
  end

  def self.rep_man(emp)
    find(emp.reporting_manager_id).first_name \
     unless emp.reporting_manager_id.nil?
  end

  def self.report(emp)
    find(emp.reporting_manager_id).first_name unless emp.reporting_manager_id.nil?
  end

  def salary(date)
    monthly_payslips.where(salary_date: date).take
  end

  def personal_salary(date)
    individual_payslip_categories.where(salary_date: date).take
  end

  private

  def create_user_account
    user = User.new do |u|
      u.first_name = first_name
      u.last_name = last_name
      u.username = employee_number
      u.employee_id = id
      u.password = employee_number
      u.role = 'Employee'
      u.email = email
      u.general_setting_id = User.current.general_setting.id
    end
    user.save
  end
end
