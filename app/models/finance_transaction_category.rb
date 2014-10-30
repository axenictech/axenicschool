class FinanceTransactionCategory < ActiveRecord::Base
	has_many  :finance_transactions
	has_one	  :finance_transaction_trigger
	
	validates :name, presence:true,length: { minimum: 1, maximum: 30}, format: { with: /\A[a-z A-Z 0-9_.-\/]+\z/ }
	validates :description, presence:true,length: { minimum: 1, maximum: 50}

	def category_amount(start_date,end_date)
		amount=0
		transactions=self.finance_transactions.where(transaction_date:start_date..end_date)
		unless transactions.nil?
			transactions.each do |t|
				amount+=t.amount
			end			
		end
		return amount
	end
end
