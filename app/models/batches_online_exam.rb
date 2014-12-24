class BatchesOnlineExam < ActiveRecord::Base
  belongs_to :batch
  belongs_to :online_exam
  scope :shod, ->(id) { where(id: id).take }
end
