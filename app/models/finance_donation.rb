class FinanceDonation < ActiveRecord::Base
	validates :donor, presence: true,length: { minimum: 1, maximum: 30 }, format: { with: /\A[a-z A-Z 0-9_.-\/]+\z/}
	validates :description, presence: true,length: { minimum: 1, maximum: 50 }
	validates :amount, presence: true,numericality:true
	validates :transaction_date,presence:true
end
		