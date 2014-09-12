class OnlineExam < ActiveRecord::Base
	# belongs_to :online_exam_group
    has_many :online_exam_questions
	has_and_belongs_to_many :batches
end
