class ExamGroup < ActiveRecord::Base
	
	belongs_to :batch
	has_many :exams,dependent: :destroy
	accepts_nested_attributes_for :exams 

	validates :name , presence:true, length:{minimum:1,maximum:30}
	validates :exam_type, presence:true
	
end
