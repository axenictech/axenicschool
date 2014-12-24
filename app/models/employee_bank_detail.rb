class EmployeeBankDetail < ActiveRecord::Base
  belongs_to :employee
  belongs_to :bank_field
  scope :shod, ->(id) { where(id: id).take }
end
