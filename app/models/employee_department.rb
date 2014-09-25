class EmployeeDepartment < ActiveRecord::Base
	has_many :employees
	validates :name, presence: true,
								length: { minimum: 1, maximum: 30 },length: { minimum: 1, maximum: 30 }, format: { with: /\A[a-z A-Z]+\z/,message: "only allows letters" }

	validates :code, presence: true,
								length: { minimum: 1, maximum: 10 }
end
