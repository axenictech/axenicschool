class Subject < ActiveRecord::Base

	belongs_to :batch
  	belongs_to :elective_group
  	
  	validates :name, presence: true, length:{minimum:1,maximum: 30}, format:{ with: /\A[a-zA-Z0-9#+_" "-]+\Z/}
	validates :code,uniqueness: true, presence: true, length:{minimum:1,maximum: 10},format:{ with: /\A[a-zA-Z0-9_" "-]+\Z/}
	validates :max_weekly_classes, presence: true, length:{maximum: 2}, numericality:{only_integer: true,less_than:20,greater_than:0}

end
