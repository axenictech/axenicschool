# GroupedExamReport
class GroupedExamReport < ActiveRecord::Base
  include Activity
  def self.gpexre(batch, student, exam_group, exam)
    where(batch_id: batch.id, student_id: \
          student, exam_group_id: \
          exam_group.id, subject_id: \
          exam.subject_id).take
  end
end
