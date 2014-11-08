class EmployeeAttendance < ActiveRecord::Base
	
  belongs_to :employee
  belongs_to :employee_leave_type
  belongs_to :EmployeeDepartment

  validates :employee_leave_type_id,presence:true
  validates :reason, presence:true, length: { minimum: 1, maximum: 50 }, format: { with: /\A[a-z A-Z 0-9]+\z/,message: "only allows letters" }
end
