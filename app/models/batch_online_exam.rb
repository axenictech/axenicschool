class BatchOnlineExam < ActiveRecord::Base
  belongs_to :online_exam
  belongs_to :batch
end
