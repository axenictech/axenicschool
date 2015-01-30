# PlacementExam
class PlacementExam < ActiveRecord::Base
  belongs_to :company
  has_many :weightages
  validates :company_id, presence: true
  validates :question_count,
            presence: true, numericality: { only_integer: true }

  def self.calculateres(test, exam, student)
    StudentExam.create(placement_exams_id: exam,
                       students_id: student.id)
    student_exam = StudentExam.where(students_id: student).take
    i = 0
    unless test.nil?
      test.each do |t|
        StudentAnswerSheet.create(student_exams_id: student_exam.id,
                                  question_databases_id: t[0],
                                  options_id: t[1])
        ans = Option.where(question_database_id: t[0].to_i,
                           id: t[1].to_i).take
        i += 1 if ans.is_answer == true
      end
    end
    StudentScore.create(placement_exams_id: exam,
                        students_id: student.id, score: i.to_f)
    score = StudentScore.where(students_id: student.id,
                               placement_exams_id: exam).take
    score
  end
end
