class StudentSubject < ActiveRecord::Base

  belongs_to :student
  belongs_to :subject

  def student_assigned(student,subject)
    StudentSubject.find_by_student_id_and_subject_id(student,subject)
  end
end
