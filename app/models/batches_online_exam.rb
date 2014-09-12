class BatchesOnlineExam < ActiveRecord::Base
	belongs_to :batch
	belongs_to :online_exam
end
