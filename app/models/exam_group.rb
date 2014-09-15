class ExamGroup < ActiveRecord::Base
	
	belongs_to :batch
	has_many :exams
	accepts_nested_attributes_for :exams 
end
