class FinanceFine < ActiveRecord::Base
  belongs_to :finance_fee_collection
  scope :shod, ->(id) { where(id: id).take }
end
