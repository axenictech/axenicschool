class BatchesController < ApplicationController
  
  	def index
     @courses=Course.all
    end

  def new
    @course=Course.find(params[:course_id])
    @batch=@course.batches.build
  end

   def create
   	@course=Course.find(params[:course_id])
   	@batch=@course.batches.new(postparam)
      if @batch.save
       flash[:notice] = 'Batch created successfully'
  	   redirect_to course_path(@course)
    else
      render 'new'
    end
  end
   
   def display
       @batch=Batch.find(params[:id])
       @students=@batch.students.all
   end

   def select
     @course = Course.find(params[:course][:id])
   end


   def edit
    @batch = Batch.find(params[:id])
     
   end

   def update
      @batch = Batch.find(params[:id])
  
         if @batch.update(postparam)
            flash[:notice] = 'Batch updated successfully!'
           redirect_to   course_path(@batch.course)
          else
           render 'edit'
         end
     end

  def destroy
     @batch = Batch.find(params[:id])
    if @batch.destroy
      flash[:notice] = 'Batch deleted successfully!'
       redirect_to course_path(@batch.course)
    else
       flash[:notice] = 'Batch unable to delete!'
       redirect_to course_path(@batch.course)
    end
  end

  def assign_tutor
    @batch=Batch.find(params[:format])
  end

  def assign_tutorial
    @emp=[]
    @batch=Batch.find(params[:format])
    @department=EmployeeDepartment.find(params[:assign_tutor][:id])
    @emp1 =@department.employees.pluck(:id)
    @emp1.each{|e| @emp<<e.to_s}
    @assign_employees=@batch.employee_id.split(',')
    @employees=@emp-@assign_employees
   end

   def assign_employee
     @batch=Batch.find(params[:batch_id])
     @employee=Employee.find(params[:format])
    unless @batch.employee_id.blank?
      @assigned_emps = @batch.employee_id.split(',')
    else
      @assigned_emps = []
    end
    @assigned_emps.push(params[:format].to_s)
    @batch.update_attributes :employee_id => @assigned_emps.join(",")
    @assign_employees = @assigned_emps.join(",")

    @emp=[]
    @department=@employee.employee_department
    @emp1 =@department.employees.pluck(:id)
    @emp1.each{|e| @emp<<e.to_s}
    @assign_emp=@batch.employee_id.split(',')
    @employees=@emp-@assign_emp
  end
  
   def remove_employee
      @batch=Batch.find(params[:batch_id])
      @employee=Employee.find(params[:format])

    @assigned_emps = @batch.employee_id.split(',')
    @removed_emps = @assigned_emps.delete(params[:format].to_s)
     @assign_employees = @assigned_emps.join(",")
    @batch.update_attributes :employee_id => @assign_employees
   @emp=[]
    @department=@employee.employee_department
    @emp1 =@department.employees.pluck(:id)
    @emp1.each{|e| @emp<<e.to_s}
    @assign_emp=@batch.employee_id.split(',')
    @employees=@emp-@assign_emp
   end

private 
def postparam
	params.require(:batch).permit(:name,:start_date,:end_date)
end

end


 
