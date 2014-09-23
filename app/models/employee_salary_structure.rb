class EmployeeSalaryStructure < ActiveRecord::Base
	 belongs_to :payroll_category
     belongs_to :employee
end
