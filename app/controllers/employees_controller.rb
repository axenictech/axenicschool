class EmployeesController < ApplicationController



  def new_category
    @employee_category = EmployeeCategory.new
    @categories1= EmployeeCategory.where(status: "active")
    @categories2 = EmployeeCategory.where(status: "inactive")
  end


  def add_category
  	
    @employee_category = EmployeeCategory.new(category_params)
   
    if @employee_category.save
      flash[:notice] = "Employee category created"
    end
    @categories1 = EmployeeCategory.where(status: "active")
    @categories2 = EmployeeCategory.where(status: "inactive")
  end

  def edit_category

    @employee_category = EmployeeCategory.find(params[:category_id])

  end

  def update_category

  @employee_category = EmployeeCategory.find(params[:category_id])
  if @employee_category.update(category_params)
    flash[:notice] = "Employee category Updated"
  end
  @categories1 = EmployeeCategory.where(status: "active")
  @categories2 = EmployeeCategory.where(status: "inactive")


  end

  def destroy_category
    @employee_category = EmployeeCategory.find(params[:id])
    if @employee_category.destroy
        flash[:notice] = "Employee category Deleted"
    end
    @categories1 = EmployeeCategory.where(status: "active")
    @categories2 = EmployeeCategory.where(status: "inactive")

  end

  def new_department
    @employee_department=EmployeeDepartment.new
    @departments1 = EmployeeDepartment.where(status: "active")
    @departments2 = EmployeeDepartment.where(status: "inactive")
  end

  def add_department
    @employee_department=EmployeeDepartment.new(department_params)
    if @employee_department.save
      flash[:notice] = "Employee department created"
    end
    @departments1 = EmployeeDepartment.where(status: "active")
    @departments2 = EmployeeDepartment.where(status: "inactive")
  end
  def edit_department
       @employee_department=EmployeeDepartment.find(params[:department_id])
  end

  def update_department
      @employee_department=EmployeeDepartment.find(params[:department_id])
     if @employee_department.update(department_params)
      flash[:notice] = "Employee department updated"
     end
      @departments1 = EmployeeDepartment.where(status: "active")
      @departments2 = EmployeeDepartment.where(status: "inactive")
  end

  def destroy_department
    @employee_department = EmployeeDepartment.find(params[:id])
   if @employee_department.destroy
    flash[:notice] = "Employee department deleted"
   end
    @departments1 = EmployeeDepartment.where(status: "active")
    @departments2 = EmployeeDepartment.where(status: "inactive")
  end

  def new_position
    @employee_position=EmployeePosition.new
    @positions1 = EmployeePosition.where(status: "active")
    @positions2 = EmployeePosition.where(status: "inactive")
  end

  def add_position
    @employee_position=EmployeePosition.new(position_params)
   if @employee_position.save
    flash[:notice] = "Employee position created"
   end
    @positions1 = EmployeePosition.where(status: "active")
    @positions2 = EmployeePosition.where(status: "inactive")
  end

  def edit_position
       @employee_position=EmployeePosition.find(params[:position_id])
    
  end

  def update_position
    @employee_position=EmployeePosition.find(params[:position_id])
    if @employee_position.update(position_params)
      flash[:notice] = "Employee position updated"
    end
    @positions1 = EmployeePosition.where(status: "active")
    @positions2 = EmployeePosition.where(status: "inactive")
    
  end

<<<<<<< HEAD
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
=======
  def destroy_position
    @employee_position = EmployeePosition.find(params[:id])
    if @employee_position.destroy
      flash[:notice] = "Employee position deleted"
    end
    @positions1 = EmployeePosition.where(status: "active")
    @positions2 = EmployeePosition.where(status: "inactive")
  end

  def new_bank_field
    @bank_field=BankField.new
    @bank_fields1 = BankField.where(status: "active")
    @bank_fields2 = BankField.where(status: "inactive")
  end

  def add_bank_field
    @bank_field=BankField.new(bank_field_params)
    if @bank_field.save
      flash[:notice] = "Employee bank field created"
    end
    @bank_fields1 = BankField.where(status: "active")
    @bank_fields2 = BankField.where(status: "inactive")
  end

  def edit_bank_field
       @bank_field=BankField.find(params[:bank_field_id])
    
  end

  def update_bank_field
    @bank_field=BankField.find(params[:bank_field_id])
    if @bank_field.update(bank_field_params)
      flash[:notice] = "Employee bank field updated"
    end
    @bank_fields1 = BankField.where(status: "active")
    @bank_fields2 = BankField.where(status: "inactive")
    
  end

  def destroy_bank_field
    @bank_field=BankField.find(params[:id])
    if @bank_field.destroy
      flash[:notice] = "Employee bank field deleted"
    end
    @bank_fields1 = BankField.where(status: "active")
    @bank_fields2 = BankField.where(status: "inactive")
  end
>>>>>>> 8e693d8068a3b50267f4dc5872cdf7b4b690a268

  private 
  def category_params
    params.require(:employee_category).permit(:name, :prefix, :status)
  end 
  
  private
  def department_params
    params.require(:employee_department).permit(:name, :code, :status)
  end 
  
  private
  def position_params
    params.require(:employee_position).permit(:name, :employee_category_id, :status)
  end 
<<<<<<< HEAD
   private
  def grade_params
    params.require(:employee_grade).permit(:name,:priority,:status,:max_hours_day,:max_hours_week)
=======

  private
  def bank_field_params
    params.require(:bank_field).permit(:name, :status)
>>>>>>> 8e693d8068a3b50267f4dc5872cdf7b4b690a268
  end
end
