class FinanceDonation < ActiveRecord::Base
	belongs_to :finance_transaction

	validates :donor, presence: true,length: { minimum: 1, maximum: 30 }, format: { with: /\A[a-z A-Z 0-9_.-\/]+\z/}
	validates :description, presence: true,length: { minimum: 1, maximum: 50 }
	validates :amount, presence: true,numericality:true
	validates :transaction_date,presence:true

  def create_transaction
  	category=FinanceTransactionCategory.find_by_name("Donation")
    transaction=category.finance_transactions.create(title:self.donor,description:self.description,amount:self.amount,transaction_date:self.transaction_date)
  	self.update(finance_transaction_id:transaction.id)
  end

  def update_transaction
    self.finance_transaction.update(title:self.donor,description:self.description,amount:self.amount,transaction_date:self.transaction_date)
  end
end
