class EmployeeLeave < ActiveRecord::Base
		 belongs_to :employee_leave_type
	 belongs_to  :employee
end
