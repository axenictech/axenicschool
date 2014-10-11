class Employee < ActiveRecord::Base
  belongs_to  :employee_category
  belongs_to  :employee_position
  belongs_to  :employee_grade
  belongs_to  :employee_department
  belongs_to  :nationality, :class_name => 'Country'
  belongs_to  :user
  belongs_to  :reporting_manager,:class_name => "Employee"
  
  has_many    :employees_subjects
  has_many    :subjects ,:through => :employees_subjects
  has_many    :timetable_entries
  has_many    :employee_bank_details
  has_many    :employee_additional_details
  has_many    :apply_leaves
  has_many    :monthly_payslips
  has_many    :employee_salary_structures
  has_many    :finance_transactions, :as => :payee
  has_many    :employee_attendances

 after_save :create_user_account

validates :first_name, presence: true,length:{minimum:1, maximum:20}, format:{ with: /\A[a-zA-Z_" "-]+\Z/}    
  validates :middle_name,length:{minimum:1,maximum:20}, format:{ with: /\A[a-zA-Z_" "-]+\Z/},allow_blank: true
  validates :last_name,presence: true,length:{minimum:1, maximum:20}, format:{ with: /\A[a-zA-Z_" "-]+\Z/}
  validates :email,format:{with: /\A[a-zA-Z0-9._-]+@([a-zA-Z0-9]+\.)+[a-zA-Z]{2,4}+\z/},allow_blank: true
  validates :date_of_birth, presence: true
  validates :employee_department,presence: true
  validates :employee_category,presence: true
  validates :employee_position,presence: true
  validates :employee_grade, presence: true
  validates :qualification,length:{minimum:1,maximum:20},format:{with: /\A[a-zA-Z_""-]+\Z/},allow_blank: true
  validates :experience_detail,length:{minimum:1,maximum:20},format:{with: /\A[a-zA-Z_""-]+\Z/},allow_blank: true
  validates :father_name,length:{minimum:1,maximum:20},format:{with:/\A[a-zA-Z_""-]+\Z/},allow_blank: true
  validates :mother_name,length:{minimum:1,maximum:20},format:{with:/\A[a-zA-Z ""-]+\Z/} ,allow_blank: true
  validates :home_address_line1,length:{:in=> 1..30},allow_blank: true
  validates :home_address_line2,length:{:in=>1..30},allow_blank: true
  validates :home_city, format: { with: /\A[a-z A-Z]+\z/,message: "only allows letters" },
              length:{:in=> 1..30},allow_blank: true
  validates :home_state,format: { with: /\A[a-z A-Z]+\z/,message: "only allows letters" },
              length:{:in=> 1..30},allow_blank: true
  validates :home_pin_code,numericality: { only_integer: true },
                 length:{minimum:6,maximum:6},allow_blank: true
  validates :office_address_line1,length:{:in=>1..30},allow_blank:true
  validates :office_address_line2,length:{:in=>1..30},allow_blank:true
  validates :office_city,format:{ with: /\A[a-z A-Z]+\z/,message:"only allows letters" },
              length:{:in=> 1..30},allow_blank:true
  validates :office_state,format: { with: /\A[a-z A-Z]+\z/,message:"only allows letters"},
               length:{:in=>1..30},allow_blank:true
  validates :office_pin_code,numericality:{only_integer:true},
                  length:{minimum:6,maximum:6},allow_blank:true
  validates :office_phone1,numericality:{ only_integer: true},
                   length:{minimum:11,maximum:20}  ,allow_blank:true
  validates :office_phone2,numericality:{only_integer: true},
                   length:{minimum:11,maximum:20},allow_blank:true
  validates :mobile_phone,numericality:{only_integer:true},
                   length:{minimum:10,maximum:10},allow_blank:true 
  validates :email,format:{with: /\A[a-zA-Z0-9._-]+@([a-zA-Z0-9]+\.)+[a-zA-Z]{2,4}+\z/},allow_blank: true
  validates :fax,numericality:{only_integer:true},
                    length:{minimum:10,maximum:10},allow_blank:true

                    
  def archived_employee
    employee_attributes = self.attributes   
    employee_attributes["former_id"]= self.id
    archived_employee = ArchivedEmployee.new(employee_attributes)
  end

  private
  def create_user_account
    user = User.new do |u|
      u.first_name, u.last_name, u.username, u.employee_id = first_name, last_name, employee_number, id
      u.password = "#{employee_number.to_s}123456"
      u.role = 'Employee'
      u.email = ( email == ''or User.find_by_email(email) ) ? "#{first_name+last_name+employee_number.to_s}@axenic.com" : email
    end
    user.save
  end

  end


       