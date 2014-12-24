class IndividualPayslipCategory < ActiveRecord::Base
  belongs_to :employee
  scope :shod, ->(id) { where(id: id).take }
end
