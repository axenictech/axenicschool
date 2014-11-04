class FinanceFeeCategory < ActiveRecord::Base
	has_and_belongs_to_many :batches
	has_many :finance_fee_particulars
	has_many :fee_discounts
	has_many :finance_fee_collections

	validates :name, presence:true,length: { minimum: 1, maximum: 30}, format: { with: /\A[a-z A-Z 0-9_.-\/]+\z/ }
	validates :description, presence:true,length: { minimum: 1, maximum: 50}
end
