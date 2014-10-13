class ExamGroup < ActiveRecord::Base
	
	belongs_to :batch
	has_many :exams,dependent: :destroy
	accepts_nested_attributes_for :exams 
	validates :name , presence:true, length:{minimum:1,maximum:30},format:{ with: /\A[a-zA-Z0-9._" "-\/]+\Z/}
	validates :exam_type, presence:true
	validates :weightage,numericality:{only_integer:true},
                    length:{minimum:10,maximum:10},allow_blank:true

	
end
