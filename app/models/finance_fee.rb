class FinanceFee < ActiveRecord::Base
	belongs_to :finance_fee_collection
	belongs_to :student
end
