class FinanceTransactionTrigger < ActiveRecord::Base
	validates :category_id, presence:true
	validates :percentage, presence:true,  numericality: {greater_than:0,less_than:100}
	validates :title, presence:true,length: { minimum: 1, maximum: 30 }, format: { with: /\A[a-z A-Z 0-9_.-\/]+\z/}
	validates :description, presence:true,length: { minimum: 1, maximum: 50}
end
