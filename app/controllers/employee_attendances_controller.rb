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

      def attendance_register
        # @employees=Employee
        @deparments=EmployeeDepartment.all
      end
      def select
        
         @deparment=EmployeeDepartment.find(params[:department][:id])
          @employees=@deparment.employees.all
          # @employee=EmployeeDepartment.find(params[:format])
           @today = Date.today
          @start_date = @today.beginning_of_month
          @end_date = @today.end_of_month



      end

      def display

            @deparment=EmployeeDepartment.find(params[:department_id])
             @employees=@deparment.employees.all
              @today = params[:next].to_date
              @start_date = @today.beginning_of_month
              @end_date = @today.end_of_month
      end
 
      def new_attendance
           @attendance = EmployeeAttendance.new
           @employee = Employee.find(params[:employee_id])
           @date = params[:attendance_date]
       end

    def create
        @attendance = EmployeeAttendance.new(params_attendance)
        @employee = Employee.find(params[:employee_attendance][:employee_id])
            
          @date = params[:employee_attendance][:attendance_date]
          @attendance.save
           @deparment=@employee.employee_department
          @employees=@deparment.employees.all    
         @today = @date.to_date
          @start_date = @today.beginning_of_month
              @end_date = @today.end_of_month


    end

    def edit_attendance
         # @leave_type= EmployeeLeaveType.all
         @attendance= EmployeeAttendance.find(params[:id])
         @employee = Employee.find(@attendance.employee_id)
          # @date = @attendance.attendance_date
    end

    def update_att
        @attendance= EmployeeAttendance.find(params[:id])
         @employee = Employee.find(@attendance.employee_id)
          @date = @attendance.attendance_date
         @attendance.update(params_attendance)
           @deparment=@employee.employee_department
          @employees=@deparment.employees.all    
         @today = @date.to_date
          @start_date = @today.beginning_of_month
              @end_date = @today.end_of_month
    end
     
     def destroy_attendance
          @attendance= EmployeeAttendance.find(params[:id])
          @employee = Employee.find(@attendance.employee_id)
          @attendance.destroy
          @date = @attendance.attendance_date
          @deparment=@employee.employee_department
          @employees=@deparment.employees.all    
          @today = @date.to_date
          @start_date = @today.beginning_of_month
          @end_date = @today.end_of_month
     end

    private
    def params_leave
         params.require(:employee_leave_type).permit(:name,:code,:status,:max_leave_count,:enable_carry_forward)
    end

    def params_attendance

         params.require(:employee_attendance).permit(:attendance_date, :employee_leave_type_id,:reason,:is_half_day,:employee_id)
    
    end
end
