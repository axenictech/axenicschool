# Course Controller
class CoursesController < ApplicationController
  before_filter :find_course, only: \
  [:show, :grouped_batches, :assign_all, :remove_all, :edit, :update, :destroy]
  def index
    @courses ||= Course.all
    authorize! :read, @courses.first
  end

  def new
    @course = Course.new
    @batch = Batch.new
    @course.batches.build
    authorize! :create, @course
  end

  def create
    @course = Course.new(postparam)
    if @course.save
      flash[:notice] = t('course_created')
      redirect_to courses_path
    else
      render 'new'
    end
  end

  def show
    @batch = @course.batches.shod(params[:id])
    @batches ||= @course.batches.includes(:course)
    authorize! :read, @course
  end

  def grouped_batches
    @batches ||= @course.batches
    @batch_groups ||= @course.batch_groups
    @batch_group = BatchGroup.new
    authorize! :create, @course
  end

  def create_batch_group
    @course = Course.shod(params[:batch_group][:course_id])
    if params[:batches].present?
      create_batch_group2(params[:batch_group][:name], params[:batches])
    else
      create_batch_group3
    end
  end

  def create_batch_group2(name, batches)
    @batch_group = BatchGroup.new(name: name, course_id: @course.id)
    if @batch_group.save
      @batch_group.create_group_batch(batches, @batch_group)
      flash[:notice] = t('batch_group_created')
      redirect_to grouped_batches_course_path(@course)
    else
      render '/courses/grouped_batches'
    end
    @batch_groups ||= @course.batch_groups
  end

  def create_batch_group3
    flash[:alert] = t('batch_select')
    redirect_to grouped_batches_course_path(@course)
  end

  def edit_batch_group
    @batch_group = BatchGroup.shod(params[:id])
    @course = @batch_group.course
    @batches ||= @course.batches
    authorize! :update, @course
  end

  def update_batch_group
    @batch_group = BatchGroup.shod(params[:batch_group][:batch_group_id])
    @batch_group.update(name: params[:batch_group][:name])
    @course = @batch_group.course
    flash[:notice] = t('batch_group_updated')
  end

  def delete_batch_group
    @batch_group = BatchGroup.shod(params[:id])
    authorize! :delete, @batch_group
    @batch_group.destroy
    flash[:notice] = t('batch_group_deleted')
    redirect_to grouped_batches_course_path(@batch_group.course)
  end

  def assign_all
    @batches ||= @course.batches
    authorize! :read, @course
  end

  def remove_all
    @batches ||= @course.batches
    authorize! :read, @course
  end

  def destroy
    authorize! :delete, @course
    @course.destroy
    flash[:notice] = t('course_deleted')
    redirect_to courses_path
  end

  def edit
    authorize! :update, @course
  end

  def update
    @course.update(postparam)
    @courses ||= Course.all
    flash[:notice] = t('course_updated')
  end

  private

  def find_course
    @course = Course.shod(params[:id])
  end

  def postparam
    params.require(:course).permit!
  end
end
