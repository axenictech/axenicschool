class FeeDiscount < ActiveRecord::Base
	self.inheritance_column = nil
	belongs_to :finance_fee_category
	belongs_to :batch
	belongs_to :category
	
	validates :name, presence:true,length: { minimum: 1, maximum: 30}, format: { with: /\A[a-z A-Z 0-9_.-\/]+\z/ }
	validates :admission_no,length: { minimum: 1, maximum: 30},numericality:{only_integer:true},allow_blank:true
	validates :discount,presence:true,length: { minimum: 1, maximum: 20},numericality:true
end
