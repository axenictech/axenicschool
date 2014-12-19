class GuardiansController < ApplicationController
  def create
    @student = Student.find(params[:student_id])
    @guardian = @student.guardians.create(guardian_params)
    if @guardian.save
      redirect_to admission2_1_students_path(@student)
    else
      render template: 'students/admission2'
   end
    end

  def addguardian
    @student = Student.find(params[:student_id])
    authorize! :read, @student
  end

  def addguardian_create
    @student = Student.find(params[:format])
    @guard = @student.guardians.create(guardian_params)
    if @guard.save
      redirect_to dispguardian_students_path(@student)
    else
      render template: 'students/addguardian'
   end
  end

  def destroy
    authorize! :delete, @guard
    @guard = Guardian.find(params[:id])
    @guard.destroy
    redirect_to students_dispguardian_path(@guard.student)
  end

  def edit
    @student = Student.find(params[:student_id])
    @guard = @student.guardians.find(params[:id])
    authorize! :update, @student
  end

  def update
    @student = Student.find(params[:student_id])
    @guard = @student.guardians.find(params[:id])
    if @guard.update(guardian_params)
      redirect_to dispguardian_students_path(@guard.student)
      else
      render 'edit '
   end
  end

  private

  def guardian_params
    params.require(:guardian).permit!
  end
end
