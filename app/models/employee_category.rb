class EmployeeCategory < ActiveRecord::Base
	has_many :employee_positions
end
