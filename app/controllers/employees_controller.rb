# employee controller
class EmployeesController < ApplicationController
  def new_category
    @employee_category_new = EmployeeCategory.new
    @categories1 = EmployeeCategory.is_status
    @categories2 = EmployeeCategory.not_status
    authorize!  :create, @employee_category_new
  end

  def add_category
    @employee_category_new = EmployeeCategory.new
    @employee_category = EmployeeCategory.new(category_params)

    if @employee_category.save
      flash[:notice] = 'Employee category created Successfully'
    end

    @categories1 = EmployeeCategory.is_status
    @categories2 = EmployeeCategory.not_status
  end

  def none_privielege
  end

  def edit_category
    @employee_category = EmployeeCategory.find(params[:id])
    authorize! :create, @employee_category
  end

  def update_category
    @employee_category_new = EmployeeCategory.new
    @employee_category = EmployeeCategory.find(params[:id])
    if @employee_category.update(category_params)
      flash[:notice] = 'Employee category Updated Successfully'
    end
    @categories1 = EmployeeCategory.is_status
    @categories2 = EmployeeCategory.not_status
  end

  def destroy_category
    authorize! :delete, @employee_category
    @employee_category_new = EmployeeCategory.new
    @employee_category = EmployeeCategory.find(params[:id])
    if @employee_category.destroy
      flash[:notice] = 'Employee category deleted Successfully'
    end
    @categories1 = EmployeeCategory.is_status
    @categories2 = EmployeeCategory.not_status
  end

  def new_department
    @employee_department_new = EmployeeDepartment.new
    @departments1 = EmployeeDepartment.is_status
    @departments2 = EmployeeDepartment.not_status
    authorize! :create, @employee_department_new
  end

  def add_department
    @employee_department_new = EmployeeDepartment.new
    @employee_department = EmployeeDepartment.new(department_params)
    if @employee_department.save
      flash[:notice] = 'Employee department created Successfully'
    end
    @departments1 = EmployeeDepartment.is_status
    @departments2 = EmployeeDepartment.not_status
  end

  def edit_department
    @employee_department = EmployeeDepartment.find(params[:id])
    authorize! :update, @employee_department
  end

  def update_department
    @employee_department_new = EmployeeDepartment.new
    @employee_department = EmployeeDepartment.find(params[:id])
    if @employee_department.update(department_params)
      flash[:notice] = 'Employee department updated Successfully'
    end
    @departments1 = EmployeeDepartment.is_status
    @departments2 = EmployeeDepartment.not_status
  end

  def destroy_department
    authorize! :delete, @employee_department
    @employee_department_new = EmployeeDepartment.new
    @employee_department = EmployeeDepartment.find(params[:id])
    if @employee_department.destroy
      flash[:notice] = 'Employee department deleted Successfully'
    end
    @departments1 = EmployeeDepartment.is_status
    @departments2 = EmployeeDepartment.not_status
  end

  def new_position
    @employee_position_new = EmployeePosition.new
    @positions1 = EmployeePosition.is_status
    @positions2 = EmployeePosition.not_status
    authorize! :create, @employee_position_new
  end

  def add_position
    @employee_position_new = EmployeePosition.new
    @employee_position = EmployeePosition.new(position_params)
    if @employee_position.save
      flash[:notice] = 'Employee position created Successfully'
    end
    @positions1 = EmployeePosition.is_status
    @positions2 = EmployeePosition.not_status
  end

  def edit_position
    @employee_position = EmployeePosition.find(params[:id])
    authorize! :update, @employee_position
  end

  def update_position
    @employee_position_new = EmployeePosition.new
    @employee_position = EmployeePosition.find(params[:id])
    if @employee_position.update(position_params)
      flash[:notice] = 'Employee position updated Successfully'
    end
    @positions1 = EmployeePosition.is_status
    @positions2 = EmployeePosition.not_status
  end

  def destroy_position
    authorize! :delete, @employee_position
    @employee_position_new = EmployeePosition.new
    @employee_position = EmployeePosition.find(params[:id])
    if @employee_position.destroy
      flash[:notice] = 'Employee position deleted Successfully'
    end
    @positions1 = EmployeePosition.is_status
    @positions2 = EmployeePosition.not_status
  end

  def new_bank_field
    @bank_field_new = BankField.new
    @bank_fields1 = BankField.is_status
    @bank_fields2 = BankField.not_status
    authorize! :create, @bank_field_new
  end

  def add_bank_field
    @bank_field_new = BankField.new
    @bank_field = BankField.new(bank_field_params)
    flash[:notice] = 'Bank field created Successfully' if @bank_field.save
    @bank_fields1 = BankField.is_status
    @bank_fields2 = BankField.not_status
  end

  def edit_bank_field
    @bank_field = BankField.find(params[:id])
    authorize! :update, @bank_field
  end

  def update_bank_field
    @bank_field_new = BankField.new
    @bank_field = BankField.find(params[:id])
    if @bank_field.update(bank_field_params)
      flash[:notice] = 'Bank field updated Successfully'
    end
    @bank_fields1 = BankField.is_status
    @bank_fields2 = BankField.not_status
  end

  def destroy_bank_field
    authorize! :delete, @bank_field
    @bank_field_new = BankField.new
    @bank_field = BankField.find(params[:id])
    flash[:notice] = 'Bank field deleted Successfully' if @bank_field.destroy
    @bank_fields1 = BankField.is_status
    @bank_fields2 = BankField.not_status
  end

  def new_payroll_category
    @payroll_category_new = PayrollCategory.new
    @payroll_categories1 = PayrollCategory.not_deduction
    @payroll_categories2 = PayrollCategory.is_deduction
    authorize! :create, @payroll_category_new
  end

  def add_payroll_category
    @payroll_category_new = PayrollCategory.new
    @payroll_category = PayrollCategory.new(payroll_category_params)
    if @payroll_category.save
      flash[:notice] = 'Payroll catagory created Successfully'
    end
    @payroll_categories1 = PayrollCategory.not_deduction
    @payroll_categories2 = PayrollCategory.is_deduction
  end

  def edit_payroll_category
    @payroll_category = PayrollCategory.find(params[:id])
    authorize! :update, @payroll_category
  end

  def update_payroll_category
    @payroll_category_new = PayrollCategory.new
    @payroll_category = PayrollCategory.find(params[:id])
    if @payroll_category.update(payroll_category_params)
      flash[:notice] = 'Employee payroll category updated Successfully'
    end
    @payroll_categories1 = PayrollCategory.not_deduction
    @payroll_categories2 = PayrollCategory.is_deduction
  end

  def destroy_payroll_category
    authorize! :delete, @payroll_category
    @payroll_category_new = PayrollCategory.new
    @payroll_category = PayrollCategory.find(params[:id])
    if @payroll_category.destroy
      flash[:notice] = 'Employee payroll category deleted Successfully'
    end
    @payroll_categories1 = PayrollCategory.not_deduction
    @payroll_categories2 = PayrollCategory.is_deduction
  end

  def active_payroll_category
    @payroll_category_new = PayrollCategory.new
    @payroll_category = PayrollCategory.find(params[:id])
    @payroll_category.update(status: false)
    @payroll_categories1 = PayrollCategory.not_deduction
    @payroll_categories2 = PayrollCategory.is_deduction
    authorize! :create, @payroll_category
  end

  def inactive_payroll_category
    @payroll_category_new = PayrollCategory.new
    @payroll_category = PayrollCategory.find(params[:id])
    @payroll_category.update(status: true)
    @payroll_categories1 = PayrollCategory.not_deduction
    @payroll_categories2 = PayrollCategory.is_deduction
    authorize! :create, @payroll_category
  end

  def new_grade
    @employee_grade_new = EmployeeGrade.new
    @grade1 = EmployeeGrade.is_status
    @grade2 = EmployeeGrade.not_status
    authorize! :create, @employee_grade_new
  end

  def add_grade
    @employee_grade_new = EmployeeGrade.new
    @employee_grade = EmployeeGrade.new(grade_params)
    if @employee_grade.save
      flash[:notice] = 'Employee Grade created Successfully'
    end
    @grade1 = EmployeeGrade.is_status
    @grade2 = EmployeeGrade.not_status
  end

  def edit_grade
    @employee_grade = EmployeeGrade.find(params[:id])
    authorize! :update, @employee_grade
  end

  def update_grade
    @employee_grade_new = EmployeeGrade.new
    @employee_grade = EmployeeGrade.find(params[:id])
    if @employee_grade.update(grade_params)
      flash[:notice] = 'Employee Grade updated Successfully'
    end
    @grade1 = EmployeeGrade.is_status
    @grade2 = EmployeeGrade.not_status
  end

  def destroy_grade
    authorize! :delete, @employee_grade
    @employee_grade_new = EmployeeGrade.new
    @employee_grade = EmployeeGrade.find(params[:id])
    if @employee_grade.destroy
      flash[:notice] = 'Employee Grade deleted Successfully'
    end
    @grade1 = EmployeeGrade.is_status
    @grade2 = EmployeeGrade.not_status
  end

  def admission1
    @employee = Employee.new
    @date = Date.today.strftime('%Y%m%d')
    if Employee.first.nil?
      @employee.employee_number = 1
      # flash[:notice] = t('first_emp') + ' ' + @employee.employee_number
    else
      @last_employee = Employee.last
      @employee.employee_number = @last_employee.employee_number.next
      # flash[:notice] = t('last_emp') + ' ' + @last_employee.employee_number
    end
    authorize! :create, @employee
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:notice] = "Employee details added for #{@employee.first_name}"
      redirect_to admission2_employees_path(@employee)
    else
      render 'admission1'
    end
  end

  def admission2
    @employee = Employee.find(params[:format])
    authorize! :update, @employee
  end

  def admission2_create
    @employee = Employee.find(params[:format])
    if @employee.update(employee_params)
      flash[:notice] = "Additional details added for #{@employee.first_name}"
      redirect_to admission3_employees_path(@employee)
    else
      render 'admission2'
    end
    authorize! :update, @employee
  end

  def admission3
    @employee = Employee.find(params[:format])
    @bank_fields = BankField.all
    authorize! :update, @employee
  end

  def admission3_create
    @employee = Employee.find(params[:format])
    @bank_fields = BankField.all
    if request.post?
      params[:bank_details].each_pair do |k, v|
        EmployeeBankDetail.create(employee_id: @employee.id, bank_field_id: k, bank_info: v['bank_info'])
      end
    end
    redirect_to edit_privilege_employees_path(@employee)
    authorize! :update, @employee
  end

  def edit_privilege
    # @user = User.find(params[:format])
    @employee = Employee.find(params[:format])
    @privilege_tags = PrivilegeTag.all
    authorize! :update, @employee
  end

  def update_privilege
    @employee = Employee.find(params[:format])
    @user = User.find_by_employee_id("#{@employee.id}")

    privilege_tag = params[:privilege]

    if privilege_tag.present?
      privilege_tag.each  do |p_t|

        privileges = PrivilegeTag.find(p_t).privileges.all

        unless privileges.nil?
          privileges.each do |p|
            PrivilegeUsers.create(user_id: @user.id, privilege_id: p.id)
          end
        end
      end
    end
    redirect_to admission4_employees_path(@employee)
  end

  def admission4
    @employee = Employee.find(params[:format])
    authorize! :update, @employee
  end

  def search
    @employee = Employee.find(params[:format])
    unless params[:search].empty?
      other_conditions = ''
      [] << 
      other_conditions += " AND employee_department_id = '#{params[:advance_search][:employee_department_id]}'" unless params[:advance_search][:employee_department_id] == ''
      other_conditions += " AND employee_category_id = '#{params[:advance_search][:employee_category_id]}'" unless params[:advance_search][:employee_category_id] == ''
      other_conditions += " AND employee_position_id = '#{params[:advance_search][:employee_position_id]}'" unless params[:advance_search][:employee_position_id] == ''
      other_conditions += " AND employee_grade_id = '#{params[:advance_search][:employee_grade_id]}'" unless params[:advance_search][:employee_grade_id] == ''

      @reporting_manager = Employee.where('first_name like ?' + other_conditions, "#{params[:search]}%")
    end
    authorize! :read, @employee
  end

  def update_reporting_manager_name
    @employee = Employee.find(params[:id])
    @reporting_manager = Employee.find(params[:reporting_manager_id])
    authorize! :update, @employee
  end

  def update_reporting_manager
    @employee = Employee.find(params[:id])
    @employee.update(employee_params)
    redirect_to profile_employees_path(@employee)
  end

  def change_reporting_manager
    @employee = Employee.find(params[:format])
    @reporting_manager = Employee.find(@employee.reporting_manager_id).first_name unless @employee.reporting_manager_id.nil?
    authorize! :update, @employee
  end

  def profile
    @employee = Employee.find(params[:format])
    @reporting_manager = Employee.find(@employee.reporting_manager_id).first_name unless @employee.reporting_manager_id.nil?
    authorize! :read, @employee
  end

  def edit_profile
    @employee = Employee.find(params[:format])
    authorize! :read, @employee
  end

  def update_profile
    @employee = Employee.find(params[:format])
    if @employee.update(employee_params)
      redirect_to profile_employees_path(@employee)
    else
      render 'edit_profile'
    end
  end

  def update_edit_profile
    @employee = Employee.find(params[:format])
    if @employee.update(employee_params)
      redirect_to profile_employees_path(@employee)
      flash[:notice] = t('Personal_details') + ' ' + @employee.first_name
    else
      render 'edit_personal_profile'
    end
  end

  def  update_edit_address_profile
    @employee = Employee.find(params[:format])
    if @employee.update(employee_params)
      redirect_to profile_employees_path(@employee)
      flash[:notice] = t('Address_details') + ' ' + @employee.first_name
    else
      render 'edit_address_profile'
    end
  end

  def  update_edit_contact_profile
    @employee = Employee.find(params[:format])
    if @employee.update(employee_params)
      redirect_to profile_employees_path(@employee)
      flash[:notice] = t('Contact_details') + ' ' + @employee.first_name

    else
      render 'edit_contact_profile'
    end
  end

  def employee_management
  end

  def subject_assignment
    @batches = Batch.includes(:course).all
  end

  def assign_subject
    @batch = Batch.find(params[:subject_assignment][:id])
    @subject = @batch.subjects.all
  end

  def assign_subject_disp
    @subject = Subject.find(params[:subject_assignment][:subject_id])
  end

  def list_emp
    @department = EmployeeDepartment.find(params[:subject_assignment][:id])
    @employees = @department.employees.all
    @subject = Subject.find(params[:format])
    @assigned_employees = EmployeeSubject.where(subject_id: @subject.id)
  end

  def assign_employee
    @department = EmployeeDepartment.find(params[:department_id])
    @employee = Employee.find(params[:id])
    @employees = @department.employees.all
    @subject = Subject.find(params[:format])
    @assigned_employee = EmployeeSubject.create(employee_id: @employee.id, subject_id: @subject.id)
    @assigned_employees = EmployeeSubject.where(subject_id: @subject.id)
    authorize! :update, @employee
 end

  def remove_employee
    @department = EmployeeDepartment.find(params[:department_id])
    @employee = Employee.find(params[:id])
    @employees = @department.employees.all
    @subject = Subject.find(params[:format])
    @assigned_employee = EmployeeSubject.where(employee_id: @employee.id, subject_id: @subject.id)
    @assigned_employee.destroy_all(employee_id: @employee.id, subject_id: @subject.id)
    @assigned_employees = EmployeeSubject.where(subject_id: @subject.id)
    authorize! :read, @employee
  end

  def search_employee
    @department = EmployeeDepartment.all
  end

  def search_emp
    unless params[:search].empty?
      other_conditions = ''

      other_conditions += " AND employee_department_id = '#{params[:advance_search][:employee_department_id]}'" unless params[:advance_search][:employee_department_id] == ''
      other_conditions += " AND employee_category_id = '#{params[:advance_search][:employee_category_id]}'" unless params[:advance_search][:employee_category_id] == ''
      other_conditions += " AND employee_position_id = '#{params[:advance_search][:employee_position_id]}'" unless params[:advance_search][:employee_position_id] == ''
      other_conditions += " AND employee_grade_id = '#{params[:advance_search][:employee_grade_id]}'" unless params[:advance_search][:employee_grade_id] == ''

      @employee = Employee.where('first_name LIKE ?' + other_conditions, "#{params[:search]}%")
    end
    authorize! :read, Employee
  end

  def viewall_emp
  end

  def allemp
    @department = EmployeeDepartment.find(params[:viewall][:id])
    @employees = @department.employees.all
  end

  def advance_search
  end

  def advance_search_emp
    conditions = ''
    conditions += "concat_ws(' ',first_name,last_name) like '#{params[:search][:name]}%'" unless params[:search][:name] == ''

    if params[:search][:gender]
      unless params[:search][:gender].eql? 'All'
        if conditions == ''
          conditions += "gender like '#{params[:search][:gender]}'"
        else
          conditions += " AND gender like '#{params[:search][:gender]}'"
        end
      end
    end

    if params[:search][:employee_category_id]
      if conditions == ''
        conditions += "employee_category_id = #{params[:search][:employee_category_id]}" unless params[:search][:employee_category_id] == ''
      else
        conditions += " AND employee_category_id = #{params[:search][:employee_category_id]}" unless params[:search][:employee_category_id] == ''
      end
    end

    if params[:search][:blood_group]
      if conditions == ''
        conditions += "blood_group like '#{params[:search][:blood_group]}'" unless params[:search][:blood_group] == ''
      else
        conditions += " AND blood_group like '#{params[:search][:blood_group]}'" unless params[:search][:blood_group] == ''
      end
    end

    if params[:search][:marital_status]
      if conditions == ''
        conditions += "marital_status like '#{params[:search][:marital_status]}'" unless params[:search][:marital_status] == ''
      else
        conditions += " AND marital_status like '#{params[:search][:marital_status]}'" unless params[:search][:marital_status] == ''
      end
    end

    if params[:search][:country_id]
      if conditions == ''
        conditions += "country_id='#{params[:search][:country_id]}'" unless params[:search][:country_id] == ''
      else
        conditions += " AND country_id ='#{params[:search][:country_id]}'" unless params[:search][:country_id] == ''
      end
    end

    if params[:search][:joining_date]
      if conditions == ''
        conditions += "joining_date='#{params[:search][:joining_date]}'" unless params[:search][:joining_date] == ''
      else
        conditions += " AND joining_date ='#{params[:search][:joining_date]}'" unless params[:search][:joining_date] == ''
      end
    end

    if params[:search][:employee_department_id]
      if conditions == ''
        conditions += "employee_department_id='#{params[:search][:employee_department_id]}'" unless params[:search][:employee_department_id] == ''
      else
        conditions += " AND employee_department_id='#{params[:search][:employee_department_id]}'" unless params[:search][:employee_department_id] == ''
      end
    end

    if params[:search][:employee_position_id]
      if conditions == ''
        conditions += "employee_position_id='#{params[:search][:employee_position_id]}'" unless params[:search][:employee_position_id] == ''
      else
        conditions += " AND employee_position_id='#{params[:search][:employee_position_id]}'" unless params[:search][:employee_position_id] == ''
      end
     end

    if params[:search][:employee_grade_id]
      if conditions == ''
        conditions += "employee_grade_id='#{params[:search][:employee_grade_id]}'" unless params[:search][:employee_grade_id] == ''
      else
        conditions += " AND employee_grade_id='#{params[:search][:employee_grade_id]}'" unless params[:search][:employee_grade_id] == ''
      end
    end

    if params[:search][:date_of_birth]
      if conditions == ''
        conditions += "date_of_birth='#{params[:search][:date_of_birth]}'" unless params[:search][:date_of_birth] == ''
      else
        conditions += " AND date_of_birth ='#{params[:search][:date_of_birth]}'" unless params[:search][:date_of_birth] == ''
      end
    end

    if @status = params[:search][:status]

      if params[:search][:status] == 'all'
        @employee1 = Employee.where(conditions)
        @employee2 = ArchivedEmployee.where(conditions)
        @employees = @employee1 + @employee2
      elsif params[:search][:status] == 'present'
        @employees = Employee.includes(:employee_department).where(conditions)
      else
        @employees = ArchivedEmployee.where(conditions)
      end
    end

    @search = ''
    @search += ' Name: ' + params[:search][:name].to_s + ', ' unless params[:search][:name].empty?

    if  params[:search][:gender] == 'All'
      @search += ' Gender: All' + ', '
    else
      @search += ' Gender: ' + params[:search][:gender].to_s + ', ' unless params[:search][:gender].empty?
    end

    @search += ' Blood group: ' + params[:search][:blood_group].to_s + ', ' unless params[:search][:blood_group].empty?
    @search += ' Marital Status: ' + params[:search][:marital_status].to_s + ', ' unless params[:search][:marital_status].empty?

    if params[:search][:country_id].present?
      @search += ' Country: ' + Country.find(params[:search][:country_id]).name + ', '
    end

    if params[:search][:employee_category_id].present?
      @search += ' Category: ' + EmployeeCategory.find(params[:search][:employee_category_id]).name + ', '
    end

    @search += 'Joining date:' +  params[:search][:joining_date].to_s + ', ' unless  params[:search][:joining_date].empty?

    if params[:search][:employee_department_id].present?
      @search += ' Department: ' + EmployeeDepartment.find(params[:search][:employee_department_id]).name + ', '
     end

    if params[:search][:employee_position_id].present?
      @search += ' Position: ' + EmployeePosition.find(params[:search][:employee_position_id]).name + ', '
     end

    if params[:search][:employee_grade_id].present?
      @search += ' Grade: ' + EmployeeGrade.find(params[:search][:employee_grade_id]).name + ', '
     end

    @search += ' Date of birth: ' +  params[:search][:date_of_birth].to_s + ', ' unless  params[:search][:date_of_birth].empty?

    if params[:search][:status] == 'present'
      @search += 'Staus: Present student'
    elsif params[:search][:status] == 'former'
      @search += 'Staus: Former student'
    else
      @search += ' Status: All student'
    end
    authorize! :read, @employee
  end

  def advance_search_result_pdf
    @employees = params[:employees]
    @search = params[:search]
    @general_setting = GeneralSetting.first
    render 'advance_search_result_pdf', layout: false
  end

  def payslip
  end

  def select_employee_department
    @department = EmployeeDepartment.all
  end

  def department_employee_list
    @department = EmployeeDepartment.find(params[:select_department][:id])
    @employees = @department.employees.all
  end

  def monthly_payslip
    @employee = Employee.find(params[:format])
    @independent_categories = PayrollCategory.all
    authorize! :update, @employee
  end

  def one_click_payslip
    # redirect_to employees_payslip_path
  end

  def one_click_payslip_generate
    salary_date = params[:payslip][:joining_date].to_date
    @employees = Employee.all
    already_created = MonthlyPayslip.all.pluck(:employee_id)
    @employees.each do |emp|
      if already_created.include? emp.id

      else
            counter = 0
            tot = 0
            tot_deduction = 0
            grand_tot = 0
            amount = EmployeeSaleryStructure.where(employee_id: emp[counter]).pluck(:amount)
            amount.each do |i|
              tot += i.to_f
            end

            is_deduction = PayrollCategory.where(is_deduction: 'true')
            is_deduction.each do |i|
              amount = EmployeeSaleryStructure.where(employee_id: emp.id, payroll_category_id: i).pluck(:amount)
              amount.each do   |i|
                tot_deduction += i.  to_f
              end

            end
            grand_tot = tot - tot_deduction
            MonthlyPayslip.create(employee_id: emp.id, amount: grand_tot, is_approved: false, salary_date: salary_date)
            counter += 1
        end
    end

    redirect_to payslip_employees_path
    flash[:notice] = "salery slip Generated for the :#{salary_date.strftime('%B')} 'note' : 'employees whose salary generated manually,their salery slip was not generated by this proce'"
    authorize! :update, @employee
  end

  def payroll_category
    @employee = Employee.find(params[:format])
    authorize! :update, @employee
  end

  def create_monthly_payslip
    @employee = Employee.find(params[:format])
    @salary_date = Date.parse(params[:salery_slip][:salery_date])
    unless @salary_date.to_date < @employee.joining_date.to_date
      start_date = @salary_date - ((@salary_date.day - 1).days)
      end_date = start_date + 1.month

      payslip_exists = @employee.monthly_payslips.where(salary_date: start_date..end_date).take
      total_salary = 0
      tot_deduction = 0
      amount = []
      is_deduction = PayrollCategory.where(is_deduction: 'true')
      is_deduction.each do |i|
        amount = EmployeeSaleryStructure.where(employee_id: @employee.id, payroll_category_id: i).pluck(:amount)
        amount.each do |i |
          tot_deduction += i.to_f
        end

      end

      params[:amounts].each do |amount|
        total_salary += amount[0].to_f
      end
      total_salary -= tot_deduction.to_f

      b = MonthlyPayslip.where(employee_id: @employee.id, salary_date: @salary_date).pluck(:salary_date)
      if b[0].present?
        if b[0] == @salary_date.strftime('%b')
          flash[:notice] = 'Payslip of ' + @employee.first_name + ' is already generated'
      end
      else
        MonthlyPayslip.create(salary_date: @salary_date, employee_id: params[:format], amount: total_salary)
         end

     end
    redirect_to monthly_payslip_employees_path(@employee)
    authorize! :update, @employee
  end

  def employee_structure
    @employee = Employee.find(params[:employee_id])
    @independent_categories = PayrollCategory.all
    @amount = params[:amount]
    @payroll_category = params[:id]
    @salary = EmployeeSaleryStructure.where(employee_id: @employee.id, payroll_category_id: @payroll_category).take
    if @salary.nil?
      EmployeeSaleryStructure.create(employee_id: @employee.id, payroll_category_id: @payroll_category, amount: @amount)
    else
      @salary.update(amount: @amount)
    end
    @employee.update_payroll(@payroll_category, @amount)
    authorize! :update, @employee
  end

  def create_payslip_category
    @employee = Employee.find(params[:format])
    @salary_date = (params[:salary_date])
    @created_category = IndividualPayslipCategory.new(employee_id: @employee.id, name: params[:payslip][:name], amount: params[:payslip][:amount], is_deduction: params[:payslip][:is_deduction])
    @created_category.save
    redirect_to monthly_payslip_employees_path(@employee)
    authorize! :update, @employee
  end

  def department_payslip
  end

  def select_month
    @salary_dates = MonthlyPayslip.all
    @department = params[:view_payslip][:id]
  end

  def payslip_revert
  end

  def one_click_payslip_revert
    salary_date = params[:payslip][:joining_date].to_date
    b = MonthlyPayslip.where(salary_date: @salary_date).pluck(:salary_date)
    if b[0].present?
      if b[0] == @salary_date.strftime('%b')
        flash[:notice] = 'Payslip of ' + @employee.first_name + ' is already generated'
      end
    end
    redirect_to employees_payslip_path
  end

  def view_payslip
    @salary_dates = MonthlyPayslip.all
    @department = EmployeeDepartment.find(params[:format])
    @employees = @department.employees.all
  end

  def view_employee_payslip
    @payslip = MonthlyPayslip.find_by_salary_date_and_employee_id(params[:salary_date], params[:employee_id])
    @independent_categories = PayrollCategory.all
  end

  def employee_individual_payslip_pdf
    @payslip = MonthlyPayslip.find(params[:payslip])

    @independent_categories = PayrollCategory.all
    render 'employee_individual_payslip_pdf', layout: false
  end

  def genral_profile
    @employee = Employee.find(params[:format])
    @reporting_manager = Employee.find(@employee.reporting_manager_id).first_name unless @employee.reporting_manager_id.nil?
    authorize! :read, @employee
  end

  def genral_profile_archived
    @employee = ArchivedEmployee.find(params[:format])
    authorize! :read, @employee
  end

  def personal_profile
    @employee = Employee.find(params[:format])
    @country = Country.find(@employee.country_id).name unless @employee.country_id.nil?
    authorize! :read, @employee
  end

  def personal_profile_archived
    @employee = ArchivedEmployee.find(params[:format])
    @country = Country.find(@employee.country_id).name unless @employee.country_id.nil?
    authorize! :read, @employee
  end

  def address_profile
    @employee = Employee.find(params[:format])
    @home_country = Country.find(@employee.home_country_id).name unless @employee.home_country_id.nil?
    @office_country = Country.find(@employee.office_country_id).name unless @employee.office_country_id.nil?
    authorize! :read, @employee
  end

  def address_profile_archived
    @employee = ArchivedEmployee.find(params[:format])
    @home_country = Country.find(@employee.home_country_id).name unless @employee.home_country_id.nil?
    @office_country = Country.find(@employee.office_country_id).name unless @employee.office_country_id.nil?
    authorize! :read, @employee
  end

  def contact_profile
    @employee = Employee.find(params[:format])
    authorize! :read, @employee
  end

  def contact_profile_archived
    @employee = ArchivedEmployee.find(params[:format])
    authorize! :read, @employee
  end

  def bank_info
    @employee = Employee.find(params[:format])
    @bank_details = EmployeeBankDetail.where(employee_id: @employee.id)
    authorize! :read, @employee
  end

  def bank_info_archived
    @employee = ArchivedEmployee.find(params[:format])
    @bank_details = EmployeeBankDetail.where(employee_id: @employee.id)
    authorize! :read, @employee
  end

  def emp_payroll
    @employee = Employee.find(params[:format])
    # @payroll_details = EmployeeSalaryStructure.where(employee_id:@employee)
    authorize! :read, @employee
  end

  def remove
    @employee = Employee.find(params[:format])
    authorize! :read, @employee
  end

  def change_to_former
    @employee = Employee.find(params[:format])
    authorize! :update, @employee
  end

  def create_archived_employee
    @employee = Employee.find(params[:format])

    if request.post?
      EmployeeSubject.destroy_all(employee_id: @employee.id)
      @archived_employee = @employee.archived_employee
      p 'archived employee'
      p @archived_employee
      @employee.destroy
      flash[:notice] = 'Employee #{@employee.first_name} is Archived Successfully'
      redirect_to archived_employee_profile_employees_path(@employee)
    end
 end

  def archived_employee_profile
    @employee = ArchivedEmployee.find(params[:format])
    authorize! :read, @employee
  end

  def delete_employee
    authorize! :delete, @employee
    @employee = Employee.find(params[:format])
    @employee.destroy
    flash[:notice] = "All Records of #{@employee.first_name} is Deleted Successfully"
    redirect_to @employee
  end

  def employee_profile
    @employee = Employee.find(params[:employee_id])
    @reporting_manager = Employee.find(@employee.reporting_manager_id).first_name unless @employee.reporting_manager_id.nil?
     @general_setting = GeneralSetting.first
    render 'employee_profile', layout: false
  end

  def personal_profile_pdf
    @employee = Employee.find(params[:employee_id])
    @country = Country.find(@employee.country_id).name unless @employee.country_id.nil?
     @general_setting = GeneralSetting.first
    render 'personal_profile_pdf', layout: false
  end

  def address_profile_pdf
    @employee = Employee.find(params[:employee_id])
    @home_country = Country.find(@employee.home_country_id).name unless @employee.home_country_id.nil?
    @office_country = Country.find(@employee.office_country_id).name unless @employee.office_country_id.nil?
     @general_setting = GeneralSetting.first
    render 'address_profile_pdf', layout: false
  end

  def contact_profile_pdf
    @employee = Employee.find(params[:employee_id])
     @general_setting = GeneralSetting.first
    render 'contact_profile_pdf', layout: false
  end

  def bank_info_pdf
    @employee = Employee.find(params[:employee_id])
    @bank_details = EmployeeBankDetail.where(employee_id: @employee.id)
     @general_setting = GeneralSetting.first
    render 'bank_info_pdf', layout: false
  end

  def emp_search_result_pdf
    @employees = params[:employees]
    @search = params[:search]
    render 'emp_search_result_pdf', layout: false
  end

  def edit_personal_profile
    @employee = Employee.find(params[:format])
    authorize! :read, @employee
  end

  def edit_address_profile
    @employee = Employee.find(params[:format])
    authorize! :read, @employee
  end

  def edit_contact_profile
    @employee = Employee.find(params[:format])
    authorize! :read, @employee
  end

  def edit_bank_info
    @employee = Employee.find(params[:format])
    @bank_info = @employee.employee_bank_details.includes(:bank_field).all
    authorize! :read, @employee
  end

  def update_bank_details
    @employee = Employee.find(params[:format])
    params[:banks].each_pair do |k, v|
      @bank_info = EmployeeBankDetail.find_by_id_and_employee_id(k, @employee.id)
      @bank_info.update(bank_info: v[:bank_info])
    end
    redirect_to profile_employees_path(@employee)
    flash[:notice] = "Bank details updated successfully for #{@employee.first_name}"
    authorize! :read, @employee
  end

  private

  def employee_params
    params.require(:employee).permit!
  end

  def category_params
    params.require(:employee_category).permit(:name, :prefix, :status)
  end

  def department_params
    params.require(:employee_department).permit(:name, :code, :status)
  end

  def position_params
    params.require(:employee_position).permit(:name, :employee_category_id, :status)
  end

  def grade_params
    params.require(:employee_grade).permit(:name, :priority, :status, :max_hours_day, :max_hours_week)
  end

  def bank_field_params
    params.require(:bank_field).permit(:name, :status)
  end

  def payroll_category_params
    params.require(:payroll_category).permit(:name, :percentage, :status, :is_deduction, :payroll_category_id)
  end
end
