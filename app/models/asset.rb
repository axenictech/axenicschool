class Asset < ActiveRecord::Base
	validates :title, presence:true,length: { minimum: 1, maximum: 30 }, format: { with: /\A[a-z A-Z]+\z/}
	validates :description, presence:true,length: { minimum: 1, maximum: 50 }
	validates :amount, presence:true,numericality:true 
end
