class EmployeeGrade < ActiveRecord::Base
	validates :name, presence: true,length: { minimum: 1, maximum: 20 }

	validates :priority, presence: true, numericality: true
	validates :max_hours_day, presence: true, numericality: true

	validates :max_hours_week, presence: true, numericality: true
end
