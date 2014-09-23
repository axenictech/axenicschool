class FinanceFeeCategory < ActiveRecord::Base
	validates :name, presence:true, 
									length: { minimum: 1, maximum: 20}
	validates :description, presence:true,
									length: { minimum: 1, maximum: 20}
end
