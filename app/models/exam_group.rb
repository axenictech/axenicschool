class ExamGroup < ActiveRecord::Base
	
	belongs_to :batch
	has_many :exams
end
