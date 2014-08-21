class Course < ActiveRecord::Base
	has_many :batches, dependent: :destroy
	accepts_nested_attributes_for :batches 
	validates :course_name,presence:true ,length:{maximum:20}
	validates :code,presence:true
	validates :section_name,presence:true
	# validates :batch_name , presence: true

	# validates :grading_type,presence:true
end
