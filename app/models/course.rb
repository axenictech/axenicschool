class Course < ActiveRecord::Base
	has_many :batches
	validates :course_name,presence:true ,length:{minimum: 5,maximum:8}
	validates :code,presence:true
	validates :section_name,presence:true
	validates :is_deleted,presence:true
	validates :grading_type,presence:true
end
