class ExamScore < ActiveRecord::Base
  belongs_to :student
  belongs_to :exam
  belongs_to :grading_level
  validates :marks,numericality:true,allow_blank: true
  validates :remarks, length:{minimum:1,maximum:30},format:{ with: /\A[a-zA-Z0-9._" "-\/]+\Z/},allow_blank: true
  validate :marks_cant_be_greater_than_maximum_marks
  validate :marks_cant_be_negative

  def marks_cant_be_negative
  	if  marks.present? and marks < 0 
			errors.add(:marks, "cannot be negative");
	end	
  end

  def marks_cant_be_greater_than_maximum_marks 
  	if  marks.present? and marks > self.exam.maximum_marks 
			errors.add(:marks, "cannot be greater than maximum marks");
		end	
  end

  def calculate_percentage
    percentage = self.marks.to_f * 100 / self.exam.maximum_marks.to_f
  end
end
