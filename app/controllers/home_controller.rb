class HomeController < ApplicationController
  def dashboard
  	if current_user.role == 'Student'
      @student = Student.where(id: current_user.student_id).take
      @student = ArchivedStudent.where(student_id: current_user.student_id).take if @student.nil?
    end
  end
end

