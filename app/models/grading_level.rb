class GradingLevel < ActiveRecord::Base

	belongs_to :batch

	validates :name, presence: true, length:{minimum:1,maximum: 15}, format:{ with: /\A[a-zA-Z0-9" "]+\Z/}
	validates :min_score, presence: true ,numericality: { only_integer: true ,greater_than:0,less_than:100}
	validates :description, presence: true ,length:{minimum:5,maximum: 20}

end
