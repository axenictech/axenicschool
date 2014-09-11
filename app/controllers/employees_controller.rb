class EmployeesController < ApplicationController



  def new_category
    @employee_category = EmployeeCategory.new
    @categories1= EmployeeCategory.where(status: "active")
    @categories2 = EmployeeCategory.where(status: "inactive")
  end


  def add_category
  	
    @employee_category = EmployeeCategory.new(category_params)
    @employee_category.save
    @categories1 = EmployeeCategory.where(status: "active")
    @categories2 = EmployeeCategory.where(status: "inactive")
  end

  def edit_category

    @employee_category = EmployeeCategory.find(params[:category_id])

  end

  def update_category

  @employee_category = EmployeeCategory.find(params[:category_id])
  @employee_category.update(category_params)

  end

  def destroy_category
    @employee_category = EmployeeCategory.find(params[:id])
    @employee_category.destroy
  end

  def new_department
    @employee_department=EmployeeDepartment.new
    @departments1 = EmployeeDepartment.where(status: "active")
    @departments2 = EmployeeDepartment.where(status: "inactive")
  end

  def add_department
    @employee_department=EmployeeDepartment.new(department_params)
    @employee_department.save
    @departments1 = EmployeeDepartment.where(status: "active")
    @departments2 = EmployeeDepartment.where(status: "inactive")
  end
  def edit_department
       @employee_department=EmployeeDepartment.find(params[:department_id])
  end

  def update_department
      @employee_department=EmployeeDepartment.find(params[:department_id])
      @employee_department.update(department_params)
  end

  def new_position
    @employee_position=EmployeePosition.new
    @positions1 = EmployeePosition.where(status: "active")
    @positions2 = EmployeePosition.where(status: "inactive")
  end

  def add_position
    @employee_position=EmployeePosition.new(position_params)
    @employee_position.save
    @positions1 = EmployeePosition.where(status: "active")
    @positions2 = EmployeePosition.where(status: "inactive")
  end

  def edit_position
       @employee_position=EmployeePosition.find(params[:position_id])
    
  end

  def update_position
    @employee_position=EmployeePosition.find(params[:position_id])
    @employee_position.update(position_params)
    
  end

  private 
  def category_params
    params.require(:employee_category).permit(:name, :prefix, :status)
  end 

  def department_params
    params.require(:employee_department).permit(:name, :code, :status)
  end 

  def position_params
    params.require(:employee_position).permit(:name, :employee_category_id, :status)
  end 
end
