class FinanceTransaction < ActiveRecord::Base
	belongs_to :finance_transaction_category
	
	validates :title, presence:true,length: { minimum: 1, maximum: 30 }, format: { with: /\A[a-z A-Z 0-9_.-\/]+\z/}
	validates :description, presence:true,length: { minimum: 1, maximum: 50}
	validates :amount, presence:true, numericality:true
	validates :transaction_date,presence:true
	validates :finance_transaction_category_id, presence:true
end
