class Liability < ActiveRecord::Base
	validates :title, presence:true,
								length: { minimum: 1, maximum: 30 }, format: { with: /\A[a-z A-Z]+\z/,message: "only allows letters" }
	validates :description, presence:true,
								length: { minimum: 1, maximum: 50 }							

	validates :amount, presence:true
	validates_numericality_of :amount 
end
