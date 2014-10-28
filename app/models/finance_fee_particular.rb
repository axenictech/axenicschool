class FinanceFeeParticular < ActiveRecord::Base
	belongs_to :finance_fee_category
	belongs_to :student
end
