class FinanceTransactionCategory < ActiveRecord::Base
	has_many  :finance_transactions
	has_one	  :finance_transaction_trigger
	
	validates :name, presence:true,length: { minimum: 1, maximum: 30}, format: { with: /\A[a-z A-Z 0-9_.-\/]+\z/ }
	validates :description, presence:true,length: { minimum: 1, maximum: 50}
end
