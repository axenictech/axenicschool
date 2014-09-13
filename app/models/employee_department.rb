class EmployeeDepartment < ActiveRecord::Base
	validates :name, presence: true,
								length: { minimum: 1, maximum: 20 }

	validates :code, presence: true,
								length: { minimum: 1, maximum: 20 }
end
