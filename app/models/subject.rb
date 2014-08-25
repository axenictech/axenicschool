class Subject < ActiveRecord::Base

	belongs_to :batch
  	belongs_to :elective_group
  	
  	validates :name, presence: true, length:{maximum: 20}, format:{ with: /\A[a-zA-Z0-9" "]+\Z/}
	validates :code, presence: true, length:{maximum: 10}
	validates :max_weekly_classes, presence: true, length:{maximum: 2}, numericality:{only_integer: true}

end
