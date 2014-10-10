class ExamScore < ActiveRecord::Base
  belongs_to :student
  belongs_to :exam
  belongs_to :grading_level
  validates :marks,numericality: { only_integer: true },
              length:{minimum:1,maximum:3}
  validates :remarks, length:{minimum:1,maximum:30},format:{ with: /\A[a-zA-Z0-9._" "-\/]+\Z/}
  
  def calculate_percentage
    percentage = self.marks.to_f * 100 / self.exam.maximum_marks.to_f
  end
end
