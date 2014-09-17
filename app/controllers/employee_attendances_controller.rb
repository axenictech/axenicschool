class EmployeeAttendancesController < ApplicationController
	def new_leave_type
		@new_leave_type=EmployeeLeaveType.new
		@active_leaves=EmployeeLeaveType.where(status: true)
        @inactive_leaves=EmployeeLeaveType.where(status: false)
	end
    
    def	add_leave_type
    	@new_leave_type=EmployeeLeaveType.new
        @new_leave_type1=EmployeeLeaveType.new(params_leave)
        if @new_leave_type1.save
       	 flash[:notice] = 'Employee Leavetype created successfully!'
       	else
       	 flash[:notice] = 'Employee Leavetype not created successfully!'
        end
        @active_leaves=EmployeeLeaveType.where(status: true)
        @inactive_leaves=EmployeeLeaveType.where(status: false)
    end

    def destroy_leave_type
         @new_leave_type=EmployeeLeaveType.new
         @leave_type= EmployeeLeaveType.find(params[:id])
         if @leave_type.destroy
         	flash[:notice] = 'Employee Leavetype created successfully!'
         end
         @active_leaves=EmployeeLeaveType.where(status: true)
         @inactive_leaves=EmployeeLeaveType.where(status: false)
     end

   
     
     def edit_leave_type
         @edit_leave_type=EmployeeLeaveType.find(params[:id])
     end

       def update_leave_type
     	 @new_leave_type=EmployeeLeaveType.new
         @leave_type= EmployeeLeaveType.find(params[:id])
         if @leave_type.update(params_leave)
         	flash[:notice] = 'Employee Leavetype updated successfully!'
         end
         @active_leaves=EmployeeLeaveType.where(status: true)
         @inactive_leaves=EmployeeLeaveType.where(status: false)
     end

    private
    def params_leave
         params.require(:employee_leave_type).permit(:name,:code,:status,:max_leave_count,:enable_carry_forward)
    end
end
