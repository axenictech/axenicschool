class EmployeeSaleryStructure < ActiveRecord::Base
  belongs_to :employee
  belongs_to :payroll_category
  scope :shod, ->(id) { where(id: id).take }
end
