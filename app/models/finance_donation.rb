class FinanceDonation < ActiveRecord::Base
	validates :donor, presence: true,
								length: { minimum: 1, maximum: 30 }, format: { with: /\A[a-z A-Z 0-9_.-\/]+\z/,message: "allows Alphanumeric with  _  .  -  /" }

	validates :description, presence: true,
								length: { minimum: 1, maximum: 50 }

	validates :amount, presence: true
	validates_numericality_of :amount
end
		