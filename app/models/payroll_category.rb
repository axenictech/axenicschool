class PayrollCategory < ActiveRecord::Base
	# validates :name, presence:true,
	# 						length: { minimum: 1, maximum: 35 },format: {with: /\A[a-z A-Z]+\z/,message:"only allows letter"}
	# validates :percentage, numericality: { integer_and_decimal: true ,greater_than:0,less_than:100}
end
