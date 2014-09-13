class Course < ActiveRecord::Base

	validates :course_name,presence:true ,length:{minimum:1, maximum:60}, format:{ with: /\A[a-zA-Z0-9." "]+\Z/}
	validates :section_name,presence:true,length:{minimum:1, maximum:30}, format:{ with: /\A[a-zA-Z0-9_" "-]+\Z/}
	validates :code, uniqueness: true,presence:true,length:{minimum:1, maximum:20}, format:{ with: /\A[a-zA-Z0-9_" "-]+\Z/}

	has_many :batches,dependent: :destroy
	has_many :batch_groups
	accepts_nested_attributes_for :batches 
	has_many :class_designations
	has_many :ranking_levels
end
