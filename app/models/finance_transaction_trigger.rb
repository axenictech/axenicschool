class FinanceTransactionTrigger < ActiveRecord::Base
	validates :finance_fee_category_id, presence:true
	validates :percentage, presence:true,  numericality: {greater_than:0,less_than:100}
	validates :title, presence:true,length: { minimum: 1, maximum: 30 }, format: { with: /\A[a-z A-Z 0-9_.-\/]+\z/,message: "allows Alphanumeric with  _  .  -  /" }
	validates :description, presence:true,length: { minimum: 1, maximum: 50}
end
