class EmployeesController < ApplicationController
 
  def new_category
    @employee_category_new = EmployeeCategory.new
    @categories1= EmployeeCategory.where(status: true)
    @categories2 = EmployeeCategory.where(status: false)
  end


  def add_category
    @employee_category_new = EmployeeCategory.new
    @employee_category = EmployeeCategory.new(category_params)
   
    if @employee_category.save
      flash[:notice1] = "Employee category created"
    end

    @categories1 = EmployeeCategory.where(status: true)
    @categories2 = EmployeeCategory.where(status: false)
  end

  def edit_category

    @employee_category = EmployeeCategory.find(params[:category_id])

  end

  def update_category
  @employee_category_new = EmployeeCategory.new
  @employee_category = EmployeeCategory.find(params[:category_id])
  if @employee_category.update(category_params)
    flash[:notice1] = "Employee category Updated"
  end
  @categories1 = EmployeeCategory.where(status: true)
  @categories2 = EmployeeCategory.where(status: false)


  end

  def destroy_category
      @employee_category_new = EmployeeCategory.new
    @employee_category = EmployeeCategory.find(params[:id])
    if @employee_category.destroy
        flash[:notice1] = "Employee category deleted"
    end
    @categories1 = EmployeeCategory.where(status: true)
    @categories2 = EmployeeCategory.where(status: false)

  end

  def new_department
    @employee_department_new=EmployeeDepartment.new
    @departments1 = EmployeeDepartment.where(status: true)
    @departments2 = EmployeeDepartment.where(status: false)
  end

  def add_department
    @employee_department_new=EmployeeDepartment.new
    @employee_department=EmployeeDepartment.new(department_params)
    if @employee_department.save
      flash[:notice2] = "Employee department created"
    end
    @departments1 = EmployeeDepartment.where(status: true)
    @departments2 = EmployeeDepartment.where(status: false)
  end
  def edit_department
       @employee_department=EmployeeDepartment.find(params[:department_id])
  end

  def update_department
    @employee_department_new=EmployeeDepartment.new
      @employee_department=EmployeeDepartment.find(params[:department_id])
     if @employee_department.update(department_params)
      flash[:notice2] = "Employee department updated"
     end
      @departments1 = EmployeeDepartment.where(status: true)
      @departments2 = EmployeeDepartment.where(status: false)
  end

  def destroy_department
    @employee_department_new=EmployeeDepartment.new
    @employee_department = EmployeeDepartment.find(params[:id])
   if @employee_department.destroy
    flash[:notice2] = "Employee department deleted"
   end
    @departments1 = EmployeeDepartment.where(status: true)
    @departments2 = EmployeeDepartment.where(status: false)
  end

  def new_position
    @employee_position_new=EmployeePosition.new
    @positions1 = EmployeePosition.where(status: true)
    @positions2 = EmployeePosition.where(status: false)
  end

  def add_position
    @employee_position_new=EmployeePosition.new
    @employee_position=EmployeePosition.new(position_params)
   if @employee_position.save
    flash[:notice3] = "Employee position created"
   end
    @positions1 = EmployeePosition.where(status: true)
    @positions2 = EmployeePosition.where(status: false)
  end

  def edit_position
       @employee_position=EmployeePosition.find(params[:position_id])
    
  end

  def update_position
      @employee_position_new=EmployeePosition.new
    @employee_position=EmployeePosition.find(params[:position_id])
    if @employee_position.update(position_params)
      flash[:notice3] = "Employee position updated"
    end
    @positions1 = EmployeePosition.where(status: true)
    @positions2 = EmployeePosition.where(status: false)
    
  end

  def destroy_position
    @employee_position_new=EmployeePosition.new
    @employee_position = EmployeePosition.find(params[:id])
    if @employee_position.destroy
      flash[:notice3] = "Employee position deleted"
    end
    @positions1 = EmployeePosition.where(status: true)
    @positions2 = EmployeePosition.where(status: false)
  end

  def new_bank_field
    @bank_field_new=BankField.new
    @bank_fields1 = BankField.where(status: true)
    @bank_fields2 = BankField.where(status: false)
  end

  def add_bank_field
    @bank_field_new=BankField.new
    @bank_field=BankField.new(bank_field_params)
    if @bank_field.save
      flash[:notice4] = "Employee bank field created"
    end
    @bank_fields1 = BankField.where(status: true)
    @bank_fields2 = BankField.where(status: false)
  end

  def edit_bank_field
       @bank_field=BankField.find(params[:bank_field_id])
    
  end

  def update_bank_field
    @bank_field_new=BankField.new
    @bank_field=BankField.find(params[:bank_field_id])
    if @bank_field.update(bank_field_params)
      flash[:notice4] = "Employee bank field updated"
    end
    @bank_fields1 = BankField.where(status: true)
    @bank_fields2 = BankField.where(status: false)
    
  end

  def destroy_bank_field
    @bank_field_new=BankField.new
    @bank_field=BankField.find(params[:id])
    if @bank_field.destroy
      flash[:notice4] = "Employee bank field deleted"
    end
    @bank_fields1 = BankField.where(status: true)
    @bank_fields2 = BankField.where(status: false)
  end

   def new_payroll_category
    @payroll_category_new = PayrollCategory.new
    @payroll_categories1 = PayrollCategory.where(is_deduction: true)
    
   
  end

  def add_payroll_category
    @payroll_category_new = PayrollCategory.new
    @payroll_category = PayrollCategory.new(payroll_category_params)
    @payroll_category.save
    @payroll_categories1 = PayrollCategory.where(is_deduction: true)
  end
  def new_grade
    @employee_grade=EmployeeGrade.new
    @grade1 = EmployeeGrade.where(status: "active")
    @grade2 = EmployeeGrade.where(status: "inactive")
  end

  def add_grade
     @employee_grade=EmployeeGrade.new(grade_params)
     @employee_grade.save 
     @grade1 = EmployeeGrade.where(status: "active")
     @grade2 = EmployeeGrade.where(status: "inactive")
   end
  
  def edit_grade
    @employee_grade=EmployeeGrade.find(params[:grade_id])
  end

  def update_grade 
    @employee_grade=EmployeeGrade.find(params[:grade_id])
    @employee_grade.update(grade_params) 
  end 
  
  def destroy_grade
     @employee_grade=EmployeeGrade.find(params[:id])
     @employee_grade.destroy
  end   

  def admission1
    @employee=Employee.new
  end

  def create
    @employee=Employee.new(employee_params)
    @employee.save

    redirect_to employees_admission2_path(@employee)
  end

  def admission2
    @employee=Employee.find(params[:format])
  end

  def admission2_create
    @employee=Employee.find(params[:format])
    @employee.update(employee_params)
    redirect_to employees_admission3_path(@employee)
  end

  def admission3
    @employee=Employee.find(params[:format])
    @bank_fields=BankField.all

  end

  def admission3_create
      @employee=Employee.find(params[:format])
      @bank_fields=BankField.all

      if request.post?
          params[:bank_details].each_pair do |k,v|
          EmployeeBankDetail.create(:employee_id => @employee.id,:bank_field_id => k,
            :bank_info => v['bank_info'])
          
             end
             redirect_to employees_edit_privilege_path(@employee)
          end
  end

  def edit_privilege
    @employee=Employee.find(params[:format])
  end

  def update_privilege
    @employee=Employee.find(params[:format])
    redirect_to employees_admission4_path(@employee)
  end

  def admission4
     @employee=Employee.find(params[:format])
  end

  def search
    unless params[:search].empty?
      @users=Employee.where("first_name like'#{params[:search]}%' 
            OR last_name like'#{params[:search]}%'")
    end
  end


  def employee_management
    
  end

  def subject_assignment
    
  end
 
  private
  def employee_params
    params.require(:employee).permit(:employee_category_id,
                      :reporting_manager_id,
                          :employee_number,
                          :joining_date,
                          :first_name,
                        :middle_name,
                        :last_name,
                        :gender,
                        :job_title,
                        :employee_position_id,
                        :employee_department_id,
                          :employee_grade_id,
                        :qualification,
                        :experience_detail,
                        :experience_year,
                        :experience_month,
                          :status,
                        :date_of_birth,
                          :marital_status,
                        :father_name,
                        :mother_name,
                          :blood_group,
                        :country_id,
                          :email,
                          :photo_data,:home_address_line1,
                          :home_address_line2,:home_city,:home_state,
                          :home_country_id,
                      :home_pin_code,
                      :office_address_line1,:office_address_line2,
                      :office_city,:office_state,:office_country_id,
                      :office_pin_code,
                      :office_phone1,:office_phone2,:mobile_phone,
                      :home_phone,:fax)
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
    params.require(:employee_grade).permit(:name,:priority,:status,:max_hours_day,:max_hours_week)
  end
  
  def bank_field_params
    params.require(:bank_field).permit(:name, :status)
  end
  
  def payroll_category_params
    params.require(:payroll_category).permit(:name,:percentage,:status,:is_deduction)
    
  end
end
