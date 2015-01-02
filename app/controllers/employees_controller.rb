# employee controller
class EmployeesController < ApplicationController
  before_filter :grade, only: \
  [:edit_grade, :update_grade, :destroy_grade]
  before_filter :category, only:
  [:edit_category, :update_category, :destroy_category]
  before_filter :department, only: \
  [:edit_department, :update_department, :destroy_department]
  before_filter :position, only: \
  [:edit_position, :update_position, :destroy_position]
  before_filter :bank_field, only: \
  [:edit_bank_field, :update_bank_field, :destroy_bank_field]

  def emp_category
    @categories1 = EmployeeCategory.is_status
    @categories2 = EmployeeCategory.not_status
  end

  def emp_department
    @departments1 = EmployeeDepartment.is_status
    @departments2 = EmployeeDepartment.not_status
  end

  def emp_position
    @positions1 = EmployeePosition.is_status
    @positions2 = EmployeePosition.not_status
  end

  def bank_field
    @bank_fields1 = BankField.is_status
    @bank_fields2 = BankField.not_status
  end

  def pay_category
    @payroll_categories1 = PayrollCategory.not_deduction
    @payroll_categories2 = PayrollCategory.is_deduction
  end

  def emp_grade
    @grade1 = EmployeeGrade.is_status
    @grade2 = EmployeeGrade.not_status
  end

  def new_category
    @employee_category_new = EmployeeCategory.new
    emp_category
    authorize! :create, @employee_category_new
  end

  def add_category
    @employee_category_new = EmployeeCategory.new
    @employee_category = EmployeeCategory.new(category_params)
    flash[:notice] = t('emp_add_category') if @employee_category.save
    emp_category
  end

  def none_privielege
  end

  def edit_category
    authorize! :create, @employee_category
  end

  def update_category
    @employee_category_new = EmployeeCategory.new
    flash[:notice] = t('emp_update_category') if \
    @employee_category.update(category_params)
    emp_category
  end

  def destroy_category
    authorize! :delete, @employee_category
    @employee_category_new = EmployeeCategory.new
    flash[:notice] = t('emp_delete_category') if @employee_category.destroy
    emp_category
  end

  def new_department
    @employee_department_new = EmployeeDepartment.new
    emp_department
    authorize! :create, @employee_department_new
  end

  def add_department
    @employee_department_new = EmployeeDepartment.new
    @employee_department = EmployeeDepartment.new(department_params)
    flash[:notice] = t('add_emp_dept') if @employee_department.save
    emp_department
  end

  def edit_department
    authorize! :update, @employee_department
  end

  def update_department
    @employee_department_new = EmployeeDepartment.new
    flash[:notice] = 'update_dept' if \
    @employee_department.update(department_params)
    emp_department
  end

  def destroy_department
    authorize! :delete, @employee_department
    @employee_department_new = EmployeeDepartment.new
    flash[:notice] = t('destroy_dept') if @employee_department.destroy
    emp_department
  end

  def new_position
    @employee_position_new = EmployeePosition.new
    emp_position
    authorize! :create, @employee_position_new
  end

  def add_position
    @employee_position_new = EmployeePosition.new
    @employee_position = EmployeePosition.new(position_params)
    flash[:notice] = t('add_pos') if @employee_position.save
    emp_position
  end

  def edit_position
    authorize! :update, @employee_position
  end

  def update_position
    @employee_position_new = EmployeePosition.new
    flash[:notice] = t('up_pos') if @employee_position.update(position_params)
    emp_position
  end

  def destroy_position
    authorize! :delete, @employee_position
    @employee_position_new = EmployeePosition.new
    flash[:notice] = t('dest_pos') if @employee_position.destroy
    emp_position
  end

  def new_bank_field
    @bank_field_new = BankField.new
    bank_field
    authorize! :create, @bank_field_new
  end

  def add_bank_field
    @bank_field_new = BankField.new
    @bank_field = BankField.new(bank_field_params)
    flash[:notice] = 'Bank field created Successfully' if @bank_field.save
    bank_field
  end

  def edit_bank_field
    authorize! :update, @bank_field
  end

  def update_bank_field
    @bank_field_new = BankField.new
    flash[:notice] = t('up_bank') if @bank_field.update(bank_field_params)
    bank_field
  end

  def destroy_bank_field
    authorize! :delete, @bank_field
    @bank_field_new = BankField.new
    flash[:notice] = 'Bank field deleted Successfully' if @bank_field.destroy
    bank_field
  end

  def new_payroll_category
    @payroll_category_new = PayrollCategory.new
    pay_category
    authorize! :create, @payroll_category_new
  end

  def add_payroll_category
    @payroll_category_new = PayrollCategory.new
    @payroll_category = PayrollCategory.new(payroll_category_params)
    flash[:notice] = t('add_pay') if @payroll_category.save
    pay_category
  end

  def edit_payroll_category
    @payroll_category = PayrollCategory.find(params[:id])
    authorize! :update, @payroll_category
  end

  def update_payroll_category
    @payroll_category_new = PayrollCategory.new
    @payroll_category = PayrollCategory.find(params[:id])
    flash[:notice] = t('up_pay') if \
    @payroll_category.update(payroll_category_params)
    pay_category
  end

  def destroy_payroll_category
    authorize! :delete, @payroll_category
    @payroll_category = PayrollCategory.find(params[:id])
    @payroll_category_new = PayrollCategory.new
    flash[:notice] = t('dest_pay') if @payroll_category.destroy
    pay_category
  end

  def active_payroll_category
    @payroll_category_new = PayrollCategory.new
    @payroll_category = PayrollCategory.find(params[:id])
    @payroll_category.active
    pay_category
    authorize! :create, @payroll_category
  end

  def inactive_payroll_category
    @payroll_category_new = PayrollCategory.new
    @payroll_category = PayrollCategory.find(params[:id])
    @payroll_category.inactive
    pay_category
    authorize! :create, @payroll_category
  end

  def new_grade
    @employee_grade_new = EmployeeGrade.new
    emp_grade
    authorize! :create, @employee_grade_new
  end

  def add_grade
    @employee_grade_new = EmployeeGrade.new
    @employee_grade = EmployeeGrade.new(grade_params)
    flash[:notice] = t('emp_grade') if @employee_grade.save
    emp_grade
  end

  def edit_grade
    authorize! :update, @employee_grade
  end

  def update_grade
    @employee_grade_new = EmployeeGrade.new
    flash[:notice] = t('up_grade') if @employee_grade.update(grade_params)
    emp_grade
  end

  def destroy_grade
    authorize! :delete, @employee_grade
    @employee_grade_new = EmployeeGrade.new
    flash[:notice] = t('dest_grade') if @employee_grade.destroy
    emp_grade
  end

  def admission1
    @employee = Employee.new
    @date = Date.today.strftime('%Y%m%d')
    @employee.emp_no
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
    @bank_fields ||= BankField.all
    authorize! :update, @employee
  end

  def admission3_create
    @employee = Employee.find(params[:format])
    @bank_fields ||= BankField.all
    if request.post?
      EmployeeBankDetail.bankdetails(@employee, params[:bank_details])
    end
    redirect_to edit_privilege_employees_path(@employee)
    authorize! :update, @employee
  end

  def edit_privilege
    # @user = User.find(params[:format])
    @employee = Employee.find(params[:format])
    @privilege_tags ||= PrivilegeTag.all
    authorize! :update, @employee
  end

  def update_privilege
    @employee = Employee.find(params[:format])
    @user = User.find_by_employee_id("#{@employee.id}")
    privilege_tag = params[:privilege]
    PrivilegeUsers.privilege_update(privilege_tag, @user)
    redirect_to admission4_employees_path(@employee)
  end

  def admission4
    @employee = Employee.find(params[:format])
    authorize! :update, @employee
  end

  def search
    @employee = Employee.find(params[:format])
    @reporting_man = Employee.search2(params[:advance_search], params[:search])
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
    @reporting_manager = Employee.find(@employee\
    .reporting_manager_id).first_name unless @employee.reporting_manager_id.nil?
    authorize! :update, @employee
  end

  def profile
    @employee = Employee.find(params[:format])
    @reporting_manager = Employee.find(@employee\
    .reporting_manager_id).first_name unless @employee.reporting_manager_id.nil?
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
    @assigned_employees = EmployeeSubject.assign_emp(@subject)
  end

  def assign_employee
    @department = EmployeeDepartment.find(params[:department_id])
    @employee = Employee.find(params[:id])
    @employees = @department.employees.all
    @subject = Subject.find(params[:format])
    assign
    authorize! :update, @employee
  end

  def assign
    @assigned_employee = EmployeeSubject.ass_emp(@employee, @subject)
    @assigned_employees = EmployeeSubject.ass_emp1(@subject)
  end

  def remove_employee
    @department = EmployeeDepartment.find(params[:department_id])
    @employee = Employee.find(params[:id])
    @employees = @department.employees.all
    @subject = Subject.find(params[:format])
    @assigned_employee = EmployeeSubject.rem_emp(@employee, @subject)
    @assigned_employee.dest(@employee, @subject)
    @assigned_employees = EmployeeSubject.rem_emp2(@subject)
    authorize! :read, @employee
  end

  def search_employee
    @department ||= EmployeeDepartment.all
  end

  def search_emp
    @employee = Employee.search2(params[:advance_search], params[:search])
    authorize! :read, Employee
  end

  def viewall_emp
  end

  def allemp
    @department = EmployeeDepartment.find(params[:viewall][:id])
    @employees ||= @department.employees.all
  end

  def advance_search
  end

  def advance_search_emp
    @employees = Employee.adv_search(params[:search])
    @search = Employee.adv_search2(params[:search])
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
    @department ||= EmployeeDepartment.all
  end

  def department_employee_list
    @department = EmployeeDepartment.find(params[:select_department][:id])
    @employees ||= @department.employees.all
  end

  def monthly_payslip
    @employee = Employee.find(params[:format])
    @independent_categories ||= PayrollCategory.all
    authorize! :update, @employee
  end

  def one_click_payslip
    # redirect_to employees_payslip_path
  end

  def one_click_payslip_generate
    salary_date = params[:payslip][:joining_date].to_date
    @employees ||= Employee.all
    already_created = MonthlyPayslip.all.pluck(:employee_id)
    @employees.one_click(@employees, already_created, salary_date)
    one_click_pay(salary_date)
  end

  def one_click_pay(salary_date)
    redirect_to payslip_employees_path
    flash[:notice] = "#{t('one')}" + \
      ":#{salary_date.strftime('%B')}" + "#{t('one_click')}"
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
      flag = @employee.create_payslip(@employee, @salary_date)
      payslip(flag, @employee)
    end
    redirect_to monthly_payslip_employees_path(@employee)
    authorize! :update, @employee
  end

  def payslip(flag, employee)
    if flag == 0
      flash[:notice] = 'Payslip of ' + employee.first_name + "#{t('p')}"
    else
      flash[:notice] = 'Payslip of ' + employee.first_name + "#{t('paysli')}"
    end
  end

  def employee_structure
    @employee = Employee.find(params[:employee_id])
    @independent_categories = PayrollCategory.all
    @amount = params[:amount]
    @payroll_category = params[:id]
    @salary = Employee.emp(@employee, @payroll_category, @amount)
    @employee.update_payroll(@payroll_category, @amount)
    authorize! :update, @employee
  end

  def create_payslip_category
    @employee = Employee.find(params[:format])
    @salary_date = (params[:salary_date])
    @created_category = IndividualPayslipCategory\
                        .create_category(@employee, params[:payslip])
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
    @salary_date = params[:payslip][:joining_date].to_date
    b = MonthlyPayslip.where(salary_date: @salary_date).pluck(:salary_date)
    if b[0].present?
      if b[0] == @salary_date.strftime('%b')
        flash[:notice] = 'Payslip of ' + @employee.first_name + "#{t('pay')}"
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
    @payslip = MonthlyPayslip.view(params[:salary_date], params[:employee_id])
    @independent_categories = PayrollCategory.all
  end

  def employee_individual_payslip_pdf
    @payslip = MonthlyPayslip.find(params[:payslip])
    @independent_categories = PayrollCategory.all
    render 'employee_individual_payslip_pdf', layout: false
  end

  def genral_profile
    @employee = Employee.find(params[:format])
    @reporting_manager = Employee.rep_man(@employee)
    authorize! :read, @employee
  end

  def genral_profile_archived
    @employee = ArchivedEmployee.find(params[:format])
    authorize! :read, @employee
  end

  def personal_profile
    @employee = Employee.find(params[:format])
    @country = Country.per(@employee)
    authorize! :read, @employee
  end

  def personal_profile_archived
    @employee = ArchivedEmployee.find(params[:format])
    @country = Country.per(@employee)
    authorize! :read, @employee
  end

  def address_profile
    @employee = Employee.find(params[:format])
    @home_country = Country.home_country(@employee)
    @office_country = Country.office_country(@employee)
    authorize! :read, @employee
  end

  def address_profile_archived
    @employee = ArchivedEmployee.find(params[:format])
    @home_country = Country.home_country(@employee)
    @office_country = Country.office_country(@employee)
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
    @bank_details = EmployeeBankDetail.bank_details(@employee)
    authorize! :read, @employee
  end

  def bank_info_archived
    @employee = ArchivedEmployee.find(params[:format])
    @bank_details = EmployeeBankDetail.bank_details(@employee)
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
    return unless request.post?
    EmployeeSubject.destroy_all(employee_id: @employee.id)
    @archived_employee = @employee.archived_employee
    @employee.destroy
    flash[:notice] = 'Employee' + "#{@employee.first_name}" + "#{t('archived')}"
    redirect_to archived_employee_profile_employees_path(@employee)
  end

  def archived_employee_profile
    @employee = ArchivedEmployee.find(params[:format])
    authorize! :read, @employee
  end

  def delete_employee
    authorize! :delete, @employee
    @employee = Employee.find(params[:format])
    @employee.destroy
    flash[:notice] = "#{t('all')}" + " #{@employee.first_name}" + "#{t('del')}"
    redirect_to @employee
  end

  def employee_profile
    @employee = ArchivedEmployee.find(params[:employee_id])
    @reporting_manager = Employee.report(@employee)
    @general_setting = GeneralSetting.first
    render 'employee_profile', layout: false
  end

  def personal_profile_pdf
    @employee = ArchivedEmployee.find(params[:employee_id])
    @country = Country.findcountry(@employee)
    @general_setting = GeneralSetting.first
    render 'personal_profile_pdf', layout: false
  end

  def address_profile_pdf
    @employee = ArchivedEmployee.find(params[:employee_id])
    @home_country = Country.home_country(@employee)
    @office_country = Country.office_country(@employee)
    @general_setting = GeneralSetting.first
    render 'address_profile_pdf', layout: false
  end

  def contact_profile_pdf
    @employee = ArchivedEmployee.find(params[:employee_id])
    @general_setting = GeneralSetting.first
    render 'contact_profile_pdf', layout: false
  end

  def bank_info_pdf
    @employee = ArchivedEmployee.find(params[:employee_id])
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
      @bank_info = EmployeeBankDetail.up(@employee, k)
      @bank_info.update(bank_info: v[:bank_info])
    end
    redirect_to profile_employees_path(@employee)
    flash[:notice] = "#{t('bank')}" + " #{@employee.first_name}"
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
    params.require(:employee_department).permit!
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

  def grade
    @employee_grade = EmployeeGrade.find(params[:id])
  end

  def category
    @employee_category = EmployeeCategory.find(params[:id])
  end

  def department
    @employee_department = EmployeeDepartment.find(params[:id])
  end

  def position
    @employee_position = EmployeePosition.find(params[:id])
  end

  def bank_field
    @bank_field = BankField.find(params[:id])
  end
end
