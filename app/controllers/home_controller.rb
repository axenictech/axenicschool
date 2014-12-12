class HomeController < ApplicationController
  def dashboard
    @student = Student.where(id: current_user.student_id).take
    @student = ArchivedStudent.where(student_id: current_user.student_id).take if @student.nil?
  end
end

