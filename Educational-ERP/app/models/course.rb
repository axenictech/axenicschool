class Course < ActiveRecord::Base

	validates :course_name,presence:true ,length:{minimum:3, maximum:20}, format:{ with: /\A[a-zA-Z0-9" "]+\Z/}
	validates :section_name,presence:true,length:{minimum:3, maximum:20}, format:{ with: /\A[a-zA-Z0-9" "]+\Z/}
	validates :code,presence:true,length:{minimum:3, maximum:20}, format:{ with: /\A[a-zA-Z0-9 -]+\Z/}

	has_many :batches
	accepts_nested_attributes_for :batches 

end
