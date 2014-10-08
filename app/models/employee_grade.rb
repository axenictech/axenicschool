class EmployeeGrade < ActiveRecord::Base
	validates :name, presence: true,length: { minimum: 1, maximum: 20 },format:{with:/\A[a-z A-Z+-]+\z/,message:"only allows letter"}

	validates :priority,  numericality: {only_integer:true,greater_than:0,less_than:20}, :uniqueness => true
	validates :max_hours_day, numericality: {only_integer:true,greater_than:0,less_than:20}

	validates :max_hours_week,  numericality: {only_integer:true,greater_than:0,less_than:30}
end
