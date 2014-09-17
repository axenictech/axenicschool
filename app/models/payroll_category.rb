class PayrollCategory < ActiveRecord::Base
	validates :name, presence:true,
							length: { minimum: 1, maximum: 20 }
	validates :percentage, presence:true, numericality: true
end
