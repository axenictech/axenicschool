class EmployeeAttendance < ActiveRecord::Base
	
  belongs_to :employee
  belongs_to :employee_leave_type
  belongs_to :EmployeeDepartment
end
