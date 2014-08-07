class Subject < ActiveRecord::Base

#validates method for validation
	validates :name, presence: true, length:{maximum: 20}, format:{ with: /\A[a-zA-Z0-9" "]+\Z/}
	validates :code, presence: true, length:{maximum: 10}
	validates :max_weekily_classes, presence: true, length:{maximum: 2}, numericality:{only_integer: true}
	validates :credit_hours, presence: true, length:{maximum: 4}, numericality:true
end
