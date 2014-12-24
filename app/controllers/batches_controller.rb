# Batches Controller
class BatchesController < ApplicationController
  before_filter :find_batch, only: \
  [:display, :edit, :update, :delete, :assign_employee, :remove_employee]
  def index
    @courses ||= Course.all
    authorize! :read, @courses.first
  end

  def new
    @course = Course.where(id: params[:course_id]).take
    @batch = @course.batches.build
    authorize! :create, @batch
  end

  def create
    @course = Course.where(id: params[:course_id]).take
    @batch = @course.batches.new(postparam)
    if @batch.save
      flash[:notice] = t('batch_create')
      redirect_to course_path(@course)
    else
      render 'new'
    end
  end

  def display
    @batch = Batch.where(id: params[:id]).take
    @students ||= @batch.students
    authorize! :read, @batch
  end

  def select
    @course = Course.where(id: params[:course][:id]).take
    authorize! :read, @batch
  end

  def edit
    authorize! :update, @batch
  end

  def update
    if @batch.update(postparam)
      flash[:notice] = t('batch_update')
      redirect_to course_path(@batch.course)
    else
      render 'edit'
    end
  end

  def destroy
    authorize! :delete, @batch
    @batch.destroy
    flash[:notice] = t('batch_delete')
    redirect_to course_path(@batch.course)
  end

  def assign_tutor
    @batch = Batch.where(id: params[:format]).take
    authorize! :read, @batch
  end

  def assign_tutorial
    @batch = Batch.where(id: params[:format]).take
    @department = EmployeeDepartment.where(params[:assign_tutor][:id]).take
    @employees ||= @department.assign_employee(@batch)
    authorize! :read, @batch
  end

  def assign_employee
    @employee = Employee.where(id: params[:format]).take
    @assign_employees ||= @employee.assign(@batch, params[:format])
    @department = @employee.employee_department
    @employees ||= @department.assign_employee(@batch)
    authorize! :read, @batch
  end

  def remove_employee
    @employee = Employee.find(params[:format])
    @assign_employees ||= @employee.remove(@batch, params[:format])
    @department = @employee.employee_department
    @employees ||= @department.assign_employee(@batch)
    authorize! :read, @batch
  end

  private

  def find_batch
    @batch = Batch.where(id: params[:id]).take
  end

  def postparam
    params.require(:batch).permit!
  end
end
