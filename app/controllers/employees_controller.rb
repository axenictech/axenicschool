class EmployeesController < ApplicationController

    def new_category
    @employee_category_new = EmployeeCategory.new
    @categories1 = EmployeeCategory.where(status: true).order(:name)
    @categories2 = EmployeeCategory.where(status: false).order(:name)
   
  end


  def add_category
    @employee_category_new = EmployeeCategory.new
    @employee_category = EmployeeCategory.new(category_params)
   
    if @employee_category.save 
      flash[:notice1] = "Employee category created Successfully"
    end

    @categories1 = EmployeeCategory.where(status: true).order(:name)
    @categories2 = EmployeeCategory.where(status: false).order(:name)
     
  end

  def edit_category

    @employee_category = EmployeeCategory.find(params[:category_id])

  end

  def update_category
  @employee_category_new = EmployeeCategory.new
  @employee_category = EmployeeCategory.find(params[:category_id])
  if @employee_category.update(category_params)
    flash[:notice1] = "Employee category Updated Successfully"
  end
  @categories1 = EmployeeCategory.where(status: true).order(:name)
  @categories2 = EmployeeCategory.where(status: false).order(:name)

  end

  def destroy_category
      @employee_category_new = EmployeeCategory.new
    @employee_category = EmployeeCategory.find(params[:id])
    if @employee_category.destroy
        flash[:notice1] = "Employee category deleted Successfully"
    end
    @categories1 = EmployeeCategory.where(status: true).order(:name)
    @categories2 = EmployeeCategory.where(status: false).order(:name)


  end

  def new_department
    @employee_department_new=EmployeeDepartment.new
    @departments1 = EmployeeDepartment.where(status: true).order(:name)
    @departments2 = EmployeeDepartment.where(status: false).order(:name)
    
  end

  def add_department
    @employee_department_new=EmployeeDepartment.new
    @employee_department=EmployeeDepartment.new(department_params)
    if @employee_department.save
      flash[:notice2] = "Employee department created Successfully"
    end
    @departments1 = EmployeeDepartment.where(status: true).order(:name)
    @departments2 = EmployeeDepartment.where(status: false).order(:name)

  end

  def edit_department
       @employee_department=EmployeeDepartment.find(params[:department_id])
  end

  def update_department
    @employee_department_new=EmployeeDepartment.new
      @employee_department=EmployeeDepartment.find(params[:department_id])
     if @employee_department.update(department_params)
      flash[:notice2] = "Employee department updated Successfully"
     end
      @departments1 = EmployeeDepartment.where(status: true).order(:name)
      @departments2 = EmployeeDepartment.where(status: false).order(:name)
      
  end

  def destroy_department
    @employee_department_new=EmployeeDepartment.new
    @employee_department = EmployeeDepartment.find(params[:id])
   if @employee_department.destroy
    flash[:notice2] = "Employee department deleted Successfully"
   end
    @departments1 = EmployeeDepartment.where(status: true).order(:name)
    @departments2 = EmployeeDepartment.where(status: false).order(:name)
    
  end

  def new_position
    @employee_position_new=EmployeePosition.new
    @positions1 = EmployeePosition.where(status: true).order(:name)
    @positions2 = EmployeePosition.where(status: false).order(:name)
  end

  def add_position
    @employee_position_new=EmployeePosition.new
    @employee_position=EmployeePosition.new(position_params)
   if @employee_position.save
    flash[:notice3] = "Employee position created Successfully"
   end
    @positions1 = EmployeePosition.where(status: true).order(:name)
    @positions2 = EmployeePosition.where(status: false).order(:name)
  end

  def edit_position
       @employee_position=EmployeePosition.find(params[:position_id])
    
  end

  def update_position
    @employee_position_new=EmployeePosition.new
    @employee_position=EmployeePosition.find(params[:position_id])
    if @employee_position.update(position_params)
      flash[:notice3] = "Employee position updated Successfully"
    end
    @positions1 = EmployeePosition.where(status: true).order(:name)
    @positions2 = EmployeePosition.where(status: false).order(:name)
    
  end

  def destroy_position
    @employee_position_new=EmployeePosition.new
    @employee_position = EmployeePosition.find(params[:id])
    if @employee_position.destroy
      flash[:notice3] = "Employee position deleted Successfully"
    end
    @positions1 = EmployeePosition.where(status: true).order(:name)
    @positions2 = EmployeePosition.where(status: false).order(:name)
  end

  def new_bank_field
    @bank_field_new=BankField.new
    @bank_fields1 = BankField.where(status: true).order(:name)
    @bank_fields2 = BankField.where(status: false).order(:name)
  end

  def add_bank_field
    @bank_field_new=BankField.new
    @bank_field=BankField.new(bank_field_params)
    if @bank_field.save
      flash[:notice4] = "Bank field created Successfully"
    end
    @bank_fields1 = BankField.where(status: true).order(:name)
    @bank_fields2 = BankField.where(status: false).order(:name)
  end

  def edit_bank_field
       @bank_field=BankField.find(params[:bank_field_id])
    
  end

  def update_bank_field
    @bank_field_new=BankField.new
    @bank_field=BankField.find(params[:bank_field_id])
    if @bank_field.update(bank_field_params)
      flash[:notice4] = "Bank field updated Successfully"
    end
    @bank_fields1 = BankField.where(status: true).order(:name)
    @bank_fields2 = BankField.where(status: false).order(:name)
    
  end

  def destroy_bank_field
    @bank_field_new=BankField.new
    @bank_field=BankField.find(params[:id])
    if @bank_field.destroy
      flash[:notice4] = "Bank field deleted Successfully"
    end
    @bank_fields1 = BankField.where(status: true).order(:name)
    @bank_fields2 = BankField.where(status: false).order(:name)
  end

  def new_payroll_category
    @payroll_category_new = PayrollCategory.new
    @payroll_categories1 = PayrollCategory.where(is_deduction: false).order(:name)
    @payroll_categories2 = PayrollCategory.where(is_deduction: false).order(:name)
  end

  def add_payroll_category
    @payroll_category_new = PayrollCategory.new
    @payroll_category = PayrollCategory.new(payroll_category_params)
    if @payroll_category.save
        flash[:notice5] = "Payroll catagory created Successfully"
    end
    @payroll_categories1 = PayrollCategory.where(is_deduction: false).order(:name)
    @payroll_categories2 = PayrollCategory.where(is_deduction: true).order(:name)
  end

  def edit_payroll_category
    @payroll_category=PayrollCategory.find(params[:payroll_category_id])
    
  end

   def update_payroll_category
     @payroll_category_new = PayrollCategory.new
  @payroll_category=PayrollCategory.find(params[:payroll_category_id])
    if @payroll_category.update(payroll_category_params)
      flash[:notice5] = "Employee payroll category updated Successfully"
    end
   @payroll_categories1 = PayrollCategory.where(is_deduction:false).order(:name)
    @payroll_categories2 = PayrollCategory.where(is_deduction:true).order(:name)
  end 

   def destroy_payroll_category
    @payroll_category_new = PayrollCategory.new
   @payroll_category=PayrollCategory.find(params[:id])
    if @payroll_category.destroy
      flash[:notice5] = "Employee payroll category deleted Successfully"
    end
    @payroll_categories1 = PayrollCategory.where(is_deduction:false).order(:name)
    @payroll_categories2 = PayrollCategory.where(is_deduction:true).order(:name)
  end
    def active_payroll_category
      @payroll_category_new= PayrollCategory.new
      @payroll_category=PayrollCategory.find(params[:format])
      @payroll_category.update(status:false)
      @payroll_categories1 = PayrollCategory.where(is_deduction:false).order(:name)
      @payroll_categories2 = PayrollCategory.where(is_deduction:true).order(:name)
    end
    
    def inactive_payroll_category
      @payroll_category_new= PayrollCategory.new
      @payroll_category=PayrollCategory.find(params[:format])
      @payroll_category.update(status:true)
      @payroll_categories1 = PayrollCategory.where(is_deduction: false).order(:name)
      @payroll_categories2 = PayrollCategory.where(is_deduction: true).order(:name)
    end     

  def new_grade
    @employee_grade_new=EmployeeGrade.new
    @grade1 = EmployeeGrade.where(status: true).order(:name)
    @grade2 = EmployeeGrade.where(status: false).order(:name)
  end

  def add_grade
     @employee_grade_new=EmployeeGrade.new
     @employee_grade=EmployeeGrade.new(grade_params)
     if @employee_grade.save 
      flash[:notice6] = "Employee Grade created Successfully"
    end
     @grade1 = EmployeeGrade.where(status: true).order(:name)
     @grade2 = EmployeeGrade.where(status: false).order(:name)
   end
  
  def edit_grade
    @employee_grade=EmployeeGrade.find(params[:grade_id])
  end

  def update_grade 
     @employee_grade_new=EmployeeGrade.new
    @employee_grade=EmployeeGrade.find(params[:grade_id])
    if @employee_grade.update(grade_params)
      flash[:notice6] = "Employee Grade updated Successfully"
    end
    @grade1 = EmployeeGrade.where(status: true).order(:name)
    @grade2 = EmployeeGrade.where(status: false) .order(:name)
  end 
  
  def destroy_grade
     @employee_grade_new=EmployeeGrade.new
     @employee_grade=EmployeeGrade.find(params[:id])
     if @employee_grade.destroy
      flash[:notice6] = "Employee Grade deleted Successfully"
    end
     @grade1 = EmployeeGrade.where(status: true).order(:name)
     @grade2 = EmployeeGrade.where(status: false).order(:name)
  end   


  def admission1
    @employee=Employee.new
    if Employee.first.nil?
      @employee.employee_number=10101
       flash[:notice7] = "Employee number of first employee is #{@employee.employee_number}" 
    else
      @last_employee=Employee.last
      @employee.employee_number=@last_employee.employee_number.next
      flash[:notice7] = "Employee number of last employee is #{@last_employee.employee_number}" 
    end  
  end

  def create
    @employee=Employee.new(employee_params)
    if @employee.save
    flash[:notice8] = "Employee details added for #{@employee.first_name}"
    redirect_to employees_admission2_path(@employee)
    else
      render 'admission1'
    end
  end

  def admission2
    @employee=Employee.find(params[:format])
  end

  def admission2_create
    @employee=Employee.find(params[:format])
    if @employee.update(employee_params)
      flash[:notice9] = "Additional details added for #{@employee.first_name}"
    redirect_to employees_admission3_path(@employee)
    else
      render 'admission2'
    end
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
    @employee=Employee.find(params[:format])
      unless params[:search].empty?
    other_conditions = ""
   

    other_conditions += " AND employee_department_id = '#{params[:advance_search][:employee_department_id]}'" unless params[:advance_search][:employee_department_id] == ""
    other_conditions += " AND employee_category_id = '#{params[:advance_search][:employee_category_id]}'" unless params[:advance_search][:employee_category_id] == ""
    other_conditions += " AND employee_position_id = '#{params[:advance_search][:employee_position_id]}'" unless params[:advance_search][:employee_position_id] == ""
    other_conditions += " AND employee_grade_id = '#{params[:advance_search][:employee_grade_id]}'" unless params[:advance_search][:employee_grade_id] == ""
  
    @reporting_manager = Employee.where("first_name like ?"+other_conditions,"#{params[:search]}%")
    
    end   
  end

  def update_reporting_manager_name
    @employee=Employee.find(params[:id])
    @reporting_manager=Employee.find(params[:reporting_manager_id])
  end

  def update_reporting_manager
    @employee=Employee.find(params[:id])
    @employee.update(employee_params)
    redirect_to employees_profile_path(@employee)

  end

  def change_reporting_manager
     @employee=Employee.find(params[:format])
      @reporting_manager = Employee.find(@employee.reporting_manager_id) unless @employee.reporting_manager_id.nil?     
  end

  def profile
     @employee=Employee.find(params[:format])
     @reporting_manager = Employee.find(@employee.reporting_manager_id) unless @employee.reporting_manager_id.nil?
  end

  def edit_profile
       @employee=Employee.find(params[:format])
  end

  def update_profile
       @employee=Employee.find(params[:format])
       @employee.update(employee_params)
       redirect_to employees_profile_path(@employee)
  end

  
  def employee_management
    
  end

  def subject_assignment

    
  end
  def assign_subject
    @batch=Batch.find(params[:subject_assignment][:id])
   @subject=@batch.subjects.all
  end

   def assign_subject_disp
    @subject=Subject.find(params[:subject_assignment][:subject_id])
   end
   
   def list_emp
    @department=EmployeeDepartment.find(params[:subject_assignment][:id])
     @employee=@department.employees.all
     @subject=Subject.find(params[:format])
   end

   def assign_employee
    @employee=Employee.find(params[:id])
    @subject=Subject.find(params[:format])
    @assigned_employee=EmployeeSubject.create(employee_id:@employee.id,subject_id:@subject.id)
    @assigned_employees = EmployeeSubject.where(subject_id:@subject.id)
  end

  def remove_employee
    @employee=Employee.find(params[:id])
    @subject=Subject.find(params[:format])
    @assigned_employee=EmployeeSubject.where(employee_id:@employee.id,subject_id:@subject.id)
    @assigned_employee.destroy_all(employee_id:@employee.id,subject_id:@subject.id)
    @assigned_employees = EmployeeSubject.where(subject_id:@subject.id)
    
  end

  def search_employee
    @department=EmployeeDepartment.all
  end
  def search_emp
    unless params[:search].empty?
    other_conditions = ""
   

    other_conditions += " AND employee_department_id = '#{params[:advance_search][:employee_department_id]}'" unless params[:advance_search][:employee_department_id] == ""
    other_conditions += " AND employee_category_id = '#{params[:advance_search][:employee_category_id]}'" unless params[:advance_search][:employee_category_id] == ""
    other_conditions += " AND employee_position_id = '#{params[:advance_search][:employee_position_id]}'" unless params[:advance_search][:employee_position_id] == ""
    other_conditions += " AND employee_grade_id = '#{params[:advance_search][:employee_grade_id]}'" unless params[:advance_search][:employee_grade_id] == ""
  
    @employee = Employee.where("first_name LIKE ?"+other_conditions,"#{params[:search]}%")

    end

    
    
  end
 
  def viewall_emp
   
  end

  def allemp
      @department =EmployeeDepartment.find(params[:viewall][:id])
      @employees=@department.employees.all
  end  

  def advance_search
    
  end
 def advance_search_emp
   conditions=""
    conditions+="concat_ws(' ',first_name,last_name) like '#{params[:search][:name]}%'" unless params[:search][:name]==""

       if params[:search][:gender]
      unless params[:search][:gender].eql? "All"
        if conditions==""
           conditions+="gender like '#{params[:search][:gender]}'"
        else
           conditions+=" AND gender like '#{params[:search][:gender]}'"
        end
      end
    end

    if params[:search][:employee_category_id]
      if conditions==""
        conditions+="employee_category_id = #{params[:search][:employee_category_id]}" unless params[:search][:employee_category_id]==""
      else
        conditions+=" AND employee_category_id = #{params[:search][:employee_category_id]}" unless params[:search][:employee_category_id]==""
      end
    end

    if params[:search][:blood_group]
      if conditions==""
        conditions+="blood_group like '#{params[:search][:blood_group]}'" unless params[:search][:blood_group]==""
      else
        conditions+=" AND blood_group like '#{params[:search][:blood_group]}'" unless params[:search][:blood_group]==""
      end
    end

    if params[:search][:marital_status]
      if conditions==""
        conditions+="marital_status like '#{params[:search][:marital_status]}'" unless params[:search][:marital_status]==""
      else
        conditions+=" AND marital_status like '#{params[:search][:marital_status]}'" unless params[:search][:marital_status]==""
      end
    end

     if params[:search][:country_id]
      if conditions==""
        conditions+="country_id='#{params[:search][:country_id]}'" unless params[:search][:country_id]==""
      else
        conditions+=" AND country_id ='#{params[:search][:country_id]}'" unless params[:search][:country_id]==""
      end
    end

     if params[:search][:joining_date]
      if conditions==""
        conditions+="joining_date='#{params[:search][:joining_date]}'" unless params[:search][:joining_date]==""
      else
        conditions+=" AND joining_date ='#{params[:search][:joining_date]}'" unless params[:search][:joining_date]==""
      end
    end

    if params[:search][:employee_department_id]
      if conditions==""
        conditions+="employee_department_id='#{params[:search][:employee_department_id]}'" unless params[:search][:employee_department_id]==""
      else
        conditions+=" AND employee_department_id='#{params[:search][:employee_department_id]}'" unless params[:search][:employee_department_id]==""
      end
    end

   if params[:search][:employee_position_id]
      if conditions==""
        conditions+="employee_position_id='#{params[:search][:employee_position_id]}'" unless params[:search][:employee_position_id]==""
      else
        conditions+=" AND employee_position_id='#{params[:search][:employee_position_id]}'" unless params[:search][:employee_position_id]==""
      end
    end

      if params[:search][:employee_grade_id]
      if conditions==""
        conditions+="employee_grade_id='#{params[:search][:employee_grade_id]}'" unless params[:search][:employee_grade_id]==""
      else
        conditions+=" AND employee_grade_id='#{params[:search][:employee_grade_id]}'" unless params[:search][:employee_grade_id]==""
      end
    end

     if params[:search][:date_of_birth]
      if conditions==""
        conditions+="date_of_birth='#{params[:search][:date_of_birth]}'" unless params[:search][:date_of_birth]==""
      else
        conditions+=" AND date_of_birth ='#{params[:search][:date_of_birth]}'" unless params[:search][:date_of_birth]==""
      end
    end

      
    @employees=Employee.where(conditions)           
  end


  def payslip
    
  end

  def select_employee_department
     @department=EmployeeDepartment.all
  end

  def department_employee_list
      @department =EmployeeDepartment.find(params[:select_department][:id])
      @employees=@department.employees.all
  end

  def monthly_payslip
    @employee=Employee.find(params[:format])
    @independent_categories = PayrollCategory.all
  end

  def payroll_category
     @employee=Employee.find(params[:format])
  end
  def create_monthly_payslip
    @employee=Employee.find(params[:format])
    #@salary_date = ''
    @salary_date =Date.parse(params[:salery_slip][:salery_date])
     #salary_date = Date.parse(params[:salary_date])

    p @salary_date
    unless @salary_date.to_date < @employee.joining_date.to_date
        start_date =@salary_date - ((@salary_date.day - 1).days)
        end_date = start_date + 1.month
        # payslip_exists = MonthlyPayslip.where(employee_id:@employee.id,
        #   :conditions => ["salary_date >= ? and salary_date < ?", start_date, end_date])
        # if payslip_exists == []
            params[:salery_slip].each_pair do |k, v|
            row_id = EmployeeSalaryStructure.where(employee_id:@employee.id,payroll_category_id:k)
           # category_name = PayrollCategory.find(k).name
            unless row_id.nil?
              MonthlyPayslip.create(:salary_date=>start_date,:employee_id => params[:format],
                :payroll_category_id => k,:amount => v['amount'])
            else
              MonthlyPayslip.create(:salary_date=>start_date,:employee_id => params[:format],
                :payroll_category_id => k,:amount => v['amount'])
            end
          # end
      end
end
    redirect_to employees_monthly_payslip_path(@employee)
  end

  def create_payslip_category
     @employee=Employee.find(params[:format])
     @salary_date= (params[:salary_date])
     @created_category = IndividualPayslipCategory.new(:employee_id=>@employee.id,:name=>params[:payslip][:name],:amount=>params[:payslip][:amount],:is_deduction=> params[:payslip][:is_deduction])
     @created_category.save
     redirect_to employees_monthly_payslip_path(@employee)
  end

  def department_payslip
        @salary_dates = MonthlyPayslip.all

  end
  
  def view_payslip
    
  end

  def genral_profile
   @employee=Employee.find(params[:format])
   @reporting_manager = Employee.find(@employee.reporting_manager_id) unless @employee.reporting_manager_id.nil?
  end


  def personal_profile
   @employee=Employee.find(params[:format])
  end

  def address_profile
   @employee=Employee.find(params[:format])
   @home_country = Country.find(@employee.home_country_id).name unless @employee.home_country_id.nil?
   @office_country = Country.find(@employee.office_country_id).name unless @employee.home_country_id.nil?

  end

  def contact_profile
   @employee=Employee.find(params[:format])
  end

  def bank_info
   @employee=Employee.find(params[:format])
   @bank_details = EmployeeBankDetail.where(employee_id:@employee.id)
   p "supriyaaaaaaaaaaaaaaaaaa"
   p @bank_details
  end

  def emp_payroll
   @employee=Employee.find(params[:format])
   #@payroll_details = EmployeeSalaryStructure.where(employee_id:@employee)
  end

  def remove
         @employee=Employee.find(params[:format])
  end

  def change_to_former
         @employee=Employee.find(params[:format])
  end

   def create_archived_employee
      @employee=Employee.find(params[:format])
      p "employeeeeeeeeeeeeee"
      p @employee
      if request.post?
          EmployeeSubject.destroy_all(:employee_id=>@employee.id)
          @archived_employee=@employee.archived_employee
          p"archived employee"
          p @archived_employee
          @employee.destroy
          flash[:notice] = "Employee #{@employee.first_name} is Archived Successfully" 
         redirect_to @employee

    end
  end

  def delete_employee
        @employee=Employee.find(params[:format])
        @employee.destroy
        flash[:notice] = "All Records of #{@employee.first_name} is Deleted Successfully" 
        redirect_to @employee
        p "Successfully Deleted............."
  end

  def employee_profile
    @employee=Employee.find(params[:employee_id])
    @reporting_manager = Employee.find(@employee.reporting_manager_id) unless @employee.reporting_manager_id.nil?

    render 'employee_profile',layout:false
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
    params.require(:payroll_category).permit(:name,:percentage,:status,:is_deduction,:payroll_category_id)
    
  end
end
