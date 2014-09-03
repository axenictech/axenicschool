class OnlineExam < ActiveRecord::Base
	belongs_to :online_exam_group
	has_many :online_exam_scores
end
