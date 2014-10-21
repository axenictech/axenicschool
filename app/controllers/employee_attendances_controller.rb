class EmployeeAttendancesController < ApplicationController
	def new_leave_type
		@new_leave_type=EmployeeLeaveType.new
     @employee = Employee.all
		@active_leaves=EmployeeLeaveType.where(status: true).order(:name)
    @inactive_leaves=EmployeeLeaveType.where(status: false).order(:name)
	end
    
    def	add_leave_type
    	@new_leave_type=EmployeeLeaveType.new
        @new_leave_type1=EmployeeLeaveType.new(params_leave)
         @employee = Employee.all
        if @new_leave_type1.save
            @employee.each do |e|
                EmployeeLeave.create( :employee_id => e.id, :employee_leave_type_id =>  @new_leave_type1.id, :leave_count =>  @new_leave_type1.max_leave_count)
            end
       	  flash[:notice] = 'Employee Leave type created successfully!'
       	 else
       	 flash[:notice] = 'Employee Leave type not created successfully!'
        end
        @active_leaves=EmployeeLeaveType.where(status: true).order(:name)
        @inactive_leaves=EmployeeLeaveType.where(status: false).order(:name)

    end    
       def destroy_leave_type
         @new_leave_type=EmployeeLeaveType.new
         @leave_type= EmployeeLeaveType.find(params[:id])
         if @leave_type.destroy
         	flash[:notice] = 'Employee Leave type deleted successfully!'
         end
         @active_leaves=EmployeeLeaveType.where(status: true).order(:name)
         @inactive_leaves=EmployeeLeaveType.where(status: false).order(:name)

   end
     
     def edit_leave_type
         @edit_leave_type=EmployeeLeaveType.find(params[:id])
     end

       def update_leave_type
     	 @new_leave_type=EmployeeLeaveType.new
         @leave_type= EmployeeLeaveType.find(params[:id])
         if @leave_type.update(params_leave)
         	flash[:notice] = 'Employee Leave type updated successfully!'
         end
         @active_leaves=EmployeeLeaveType.where(status: true).order(:name)
         @inactive_leaves=EmployeeLeaveType.where(status: false).order(:name)
     end

      def attendance_register
       @deparments=EmployeeDepartment.all
      end
      def select
        
         @deparment=EmployeeDepartment.find(params[:department][:id])
          @employees=@deparment.employees.all
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
           @leave_types = EmployeeLeaveType.all
       end

    def create
        @attendance = EmployeeAttendance.new(params_attendance)
        @employee = Employee.find(params[:employee_attendance][:employee_id])
        @date = params[:employee_attendance][:attendance_date]
         if @attendance.save
              @emp_leave = EmployeeLeave.find_by_employee_id(@attendance.employee_id)
              unless @emp_leave.nil?
              if @attendance.is_half_day
              leave_taken=@emp_leave.leave_taken.to_f+(0.5)
              @emp_leave.update(leave_taken: leave_taken)
              else
              leave_taken=@emp_leave.leave_taken.to_f+(1)
              @emp_leave.update(leave_taken: leave_taken)
          end
          end
             @deparment=@employee.employee_department
             @employees=@deparment.employees.all    
             @today = @date.to_date
             @start_date = @today.beginning_of_month
             @end_date = @today.end_of_month    
        end  
    end

    def edit_attendance
         @attendance= EmployeeAttendance.find(params[:id])
         @employee = Employee.find(@attendance.employee_id)
    end

    def update_att
       @attendance= EmployeeAttendance.find(params[:id])
       @employee = Employee.find(@attendance.employee_id)
       @date = @attendance.attendance_date
       @reset_count = EmployeeLeave.find_by_employee_id(@attendance.employee_id)
            unless @reset_count.nil?
            leaves_taken = @reset_count.leave_taken
            day_status = @attendance.is_half_day
            leave_type = EmployeeLeaveType.find_by_id(@attendance.employee_leave_type_id)
              end
       if @attendance.is_half_day
           half_day = true
       else
          half_day = false
       end
      
         if @attendance.update(params_attendance)
            unless leave_type.nil?
        if @attendance.employee_leave_type_id == leave_type.id
          unless day_status == @attendance.is_half_day
            if half_day
              leave = leaves_taken.to_f+(0.5)
            else
              leave = leaves_taken.to_f-(0.5)
            end
            @reset_count.update_attributes(:leave_taken => leave)
           end
         else
           if half_day
            leave = leaves_taken.to_f-(0.5)
           else
            leave = leaves_taken.to_f-(1.0)
           end
          @reset_count.update(:leave_taken => leave)
          @new_reset_count = EmployeeLeave.find_by_employee_id(@attendance.employee_id)
          leaves_taken = @new_reset_count.leave_taken
        end
          if @attendance.is_half_day
            leave = leaves_taken.to_f+(0.5)
            @new_reset_count.update(:leave_taken => leave)
          else
            leave = leaves_taken.to_f+(1)
            @new_reset_count.update(:leave_taken => leave)
          end
        end
         end
      
         @deparment=@employee.employee_department
         @employees=@deparment.employees.all    
         @today = @date.to_date
         @start_date = @today.beginning_of_month
         @end_date = @today.end_of_month
   
end
     
     def destroy_attendance
          @attendance= EmployeeAttendance.find(params[:id])
          @employee = Employee.find(@attendance.employee_id)
          
          @reset_count = EmployeeLeave.find_by_employee_id(@attendance.employee_id)
           unless @reset_count.nil?
          leaves_taken = @reset_count.leave_taken
             if @attendance.is_half_day
                 leave = leaves_taken.to_d-(0.5)
             else
                 leave = leaves_taken.to_d-(1)
             end
           end
          @attendance.destroy
          @date = @attendance.attendance_date
          @deparment=@employee.employee_department
          @employees=@deparment.employees.all    
          @today = @date.to_date
          @start_date = @today.beginning_of_month
          @end_date = @today.end_of_month
     end
    
     def attendance_report
         @deparments=EmployeeDepartment.all
     end
     def select_report
          @deparment=EmployeeDepartment.find(params[:department][:id])
          @leave_types= EmployeeLeaveType.all
          @employees=@deparment.employees.all
     end

     def report_info
        @employee = Employee.find(params[:employee_id])
    @attendance_report = EmployeeAttendance.where(employee_id:@employee.id)
    @leave_types = EmployeeLeaveType.all
    @leave_count = EmployeeLeave.where(employee_id:@employee)
    @total_leaves = 0
    @leave_types.each do |lt|
     leave_count = EmployeeAttendance.where(employee_id:@employee.id,employee_leave_type_id:lt.id).size
     @total_leaves = @total_leaves +leave_count
     end
end

   def  leave_reset_settings
     
   end
   
   def update_employee_leave_reset_all
       @leave_count = EmployeeLeave.all
       @leave_count.each do |e|
        @leave_type = EmployeeLeaveType.find_by_id(e.employee_leave_type_id)
          default_leave_count = @leave_type.max_leave_count
            available_leave = default_leave_count.to_f
            leave_taken = 0
            if e.update(:leave_taken => leave_taken,:leave_count => available_leave)
               flash[:notice] = 'Leave count reset successful for all employees'
             else
                  flash[:notice] = 'Leave count not reset successful for all employees'
             end
    end
  end
  
   def employee_leave_reset_by_department
      @departments=EmployeeDepartment.all

      # @department=EmployeeDepartment.find(params[:department_id])

   end

   def select_department
        @department=EmployeeDepartment.find(params[:department][:id])
        @employees=@department.employees.all
   end

  def assign_all
    @department=EmployeeDepartment.find(params[:format])
    @employees=@department.employees.all
     
  end

  def remove_all
       @department=EmployeeDepartment.find(params[:format])
       @employees= @department.employees.all
  end

  def update_department_leave_reset
      
        @employee = params[:employees]
   
    @employee.each do |c|
      @leave_count = EmployeeLeave.where(employee_id:c)
       @leave_count.each do |e|
        @leave_type = EmployeeLeaveType.find_by_id(e.employee_leave_type_id)
          default_leave_count = @leave_type.max_leave_count
            available_leave = default_leave_count.to_f
            leave_taken = 0
             e.update(:leave_taken => leave_taken,:leave_count => available_leave)
            
    end
end
     redirect_to employee_attendances_employee_leave_reset_by_department_path
               flash[:notice] = 'Department Wise Leave Reset Successfull'
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

   def employee_leave_detail
     @employee = Employee.find_by_id(params[:format])
    @leave_count = EmployeeLeave.where(employee_id:@employee.id)
   end

    private
    def params_leave
         params.require(:employee_leave_type).permit(:name,:code,:status,:max_leave_count,:enable_carry_forward,:employee_id)
    end

    def params_attendance

         params.require(:employee_attendance).permit(:attendance_date, :employee_leave_type_id,:reason,:is_half_day,:employee_id)
    end

    def params_leave_taken
       params.require(:employee_leave).permit(:employee,:employee_leave_type,:leave_count,:leave_taken,:reset_date,:employee_id)
    end
end

