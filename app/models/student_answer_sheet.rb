class StudentAnswerSheet < ActiveRecord::Base
  belongs_to :student_exams
  belongs_to :question_databases
  belongs_to :options
end
