class EmployeeSubject < ActiveRecord::Base
  belongs_to :employee
  belongs_to :subject
  has_one :batch, through: :subject
end
