class EmployeeCategory < ActiveRecord::Base
	has_many :employee_positions
	validates :name, presence: true,
								length: { minimum: 1, maximum: 30 }, format: { with: /\A[a-z A-Z 0-9_.-\/]+\z/,message: "allows Alphanumeric with  _  .  -  /" }

	validates :prefix, presence: true,
								length: { minimum: 1, maximum: 20 }, format: { with: /\A[a-z A-Z.\/]+\z/,message: " allows Alphanumeric with . ,  / " }
end
