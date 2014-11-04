class FinanceFeeParticular < ActiveRecord::Base
	belongs_to :finance_fee_category
	belongs_to :category
	
	validates :name, presence:true,length: { minimum: 1, maximum: 30}, format: { with: /\A[a-z A-Z 0-9_.-\/]+\z/ }
	validates :description, presence:true,length: { minimum: 1, maximum: 50}
	validates :admission_no,length: { minimum: 1, maximum: 30},numericality:{only_integer:true},allow_blank:true
	validates :amount,length: { minimum: 1, maximum: 20},numericality:true,allow_blank:true
end
