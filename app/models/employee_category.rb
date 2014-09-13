class EmployeeCategory < ActiveRecord::Base
	has_many :employee_positions
	validates :name, presence: true,
								length: { minimum: 1, maximum: 20 }

	validates :prefix, presence: true,
								length: { minimum: 1, maximum: 20 }
end
