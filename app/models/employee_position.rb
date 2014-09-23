class EmployeePosition < ActiveRecord::Base
	  belongs_to :employee_category
	  validates :name, presence: true,
								length: { minimum: 1, maximum: 30 }, format: { with: /\A[a-z A-Z]+\z/,message: "only allows letters" }

	    validates :employee_category, presence: true


	
end
