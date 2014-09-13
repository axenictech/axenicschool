class EmployeePosition < ActiveRecord::Base
	  belongs_to :employee_category
	  validates :name, presence: true,
								length: { minimum: 3, maximum: 20 }

	    validates :employee_category, presence: true


	
end
