class ExamScore < ActiveRecord::Base
  belongs_to :student
  belongs_to :exam
  belongs_to :grading_level

  def calculate_percentage
    percentage = self.marks.to_f * 100 / self.exam.maximum_marks.to_f
  end
end
