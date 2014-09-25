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
    @batch=Batch.find(params[:format])
    @department=EmployeeDepartment.find(params[:assign_tutor][:id])
    @employees = Employee.where(employee_department_id:@department.id)
  
   end

   def assign_employee
     @batch=Batch.find(params[:batch_id])
     @employee=Employee.find(params[:format])
    if @batch.employee_id.nil?
     @batch.update(employee_id:@employee.id)
    else
      @batch.update(employee_id:[@batch.employee_id,@employee.id].join(","))
    end
     @assign_employees=@batch.employee_id.to_s.split(",")
   end

   def remove_employee
      @batch=Batch.find(params[:batch_id])
      @employee=Employee.find(params[:format])
      @assign_employees=Batch.where(employee_id:@employee.id)
      @assign_employees.destroy_all
   end


private 
def postparam
	params.require(:batch).permit(:name,:start_date,:end_date)
end

end


 
