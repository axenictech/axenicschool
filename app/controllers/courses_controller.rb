# Course Controller
class CoursesController < ApplicationController
  before_filter :find_course, only: \
  [:show, :grouped_batches, :assign_all, :remove_all, :edit, :update]
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
    @batch = @course.batches.where(course_id: params[:id]).take
    @batches = @course.batches.all
    authorize! :read, @course
  end

  def grouped_batches
    @batches = @course.batches.all
    @batch_groups = @course.batch_groups.all
    @batch_group = BatchGroup.new
    authorize! :create, @course
  end

  def create_batch_group
    @course = Course.find(params[:batch_group][:course_id])
    batches = params[:batches]
    @batches = @course.batches.all
    unless batches.nil?
      @batch_groups = @course.batch_groups.all
      name = params[:batch_group][:name]
      @batch_group = BatchGroup.new(name: name, course_id: @course.id)
      if @batch_group.save
        batches.each  do |batch|
          @group_batch = GroupBatch.new(batch_group_id: @batch_group.id, batch_id: batch)
          @group_batch.save
        end
        flash[:notice_batch_group] = t('batch_group_created')
        redirect_to grouped_batches_course_path(@course)
      else
        render template: 'courses/grouped_batches'
    end
    else
      flash[:notice_batch_group] = t('batch_select')
      redirect_to grouped_batches_course_path(@course)
      end
  end

  def edit_batch_group
    @batch_group = BatchGroup.where(id: params[:id]).take
    @course = @batch_group.course
    @batches = @course.batches.all
    authorize! :update, @course
  end

  def update_batch_group
    @batch_group = BatchGroup.where(id: \
      params[:batch_group][:batch_group_id]).take
    @batch_group.update(name: params[:batch_group][:name])
    @course = @batch_group.course
    flash[:notice_batch_group] = t('batch_group_updated')
  end

  def delete_batch_group
    authorize! :delete, @course
    @batch_group = BatchGroup.find(params[:format])
    @course = @batch_group.course
    @group_batches = GroupBatch.where(batch_group_id: @batch_group.id)
    @group_batches.each(&:destroy)
    @batch_group.destroy
    flash[:notice_batch_group] = t('batch_group_deleted')
    redirect_to grouped_batches_course_path(@course)
  end

  def assign_all
    @batches = @course.batches.all
    authorize! :read, @course
  end

  def remove_all
    @batches = @course.batches.all
    authorize! :read, @course
  end

  def destroy
    authorize! :delete, @course
    @course = Course.find(params[:format])
    if @course.destroy
      flash[:notice] = t('course_deleted')
      redirect_to courses_path
    end
  end

  def edit
    authorize! :update, @course
  end

  def update
    @course.update(postparam)
    @courses = Course.all
    flash[:notice] = t('course_updated')
  end

  private

  def find_course
    @course = Course.where(id: params[:id]).take
  end

  def postparam
    params.require(:course).permit!
  end
end
