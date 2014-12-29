# Subject Controller
class SubjectsController < ApplicationController
  before_action :set_subject, only: [:edit, :update, :destroy]

  def index
    @batches ||= Batch.includes(:course)
    authorize! :read, @batches.first
  end

  def select
    @batch = Batch.shod(params[:batch][:id])
    @subjects ||= @batch.normal_subjects
    @elective_groups ||= @batch.elective_groups
    authorize! :read, @batch
  end

  def subject
    @batch = Batch.shod(params[:batch_id])
    @subjects ||= @batch.normal_subjects
    @elective_groups ||= @batch.elective_groups
    authorize! :read, @batch
  end

  def new
    @batch = Batch.shod(params[:batch_id])
    @subject = @batch.subjects.build
    @elective_group = ElectiveGroup.shod(params[:elective_group_id]) \
    if params[:elective_group_id]
    @subject = @elective_group.subjects.build if params[:elective_group_id]
    authorize! :create, @subject
  end

  def create
    @batch = Batch.shod(params[:batch_id])
    @subjects ||= @batch.normal_subjects
    @elective_groups ||= @batch.elective_groups
    @subject = @batch.subjects.new(subject_params)
    flash[:notice] = t('subject_create')
    flash[:notice] = t('elective_create') if params[:elective_group_id]
  end

  def create_elective
    @elective_group = ElectiveGroup.shod params[:elective_group_id] \
    if params[:elective_group_id]
    @subject = @elective_group.subjects.new(subject_params) \
    if params[:elective_group_id]
    @elective_subjects ||= @elective_group.subjects \
    if params[:elective_group_id]
    @subject.save
    @subject.update(batch_id: @batch.id) if params[:elective_group_id]
  end

  def edit
    authorize! :update, @subject
  end

  def update
    @subjects ||= @batch.normal_subjects
    @elective_groups ||= @batch.elective_groups
    @elective_subjects ||= @elective_group.subjects \
    if params[:elective_group_id]
    @subject.update(subject_params)
    flash[:notice] = t('subject_update')
    flash[:notice] = t('elective_update') if params[:elective_group_id]
  end

  def destroy
    authorize! :delete, @subject
    @subjects ||= @batch.normal_subjects
    @elective_groups ||= @batch.elective_groups
    @elective_subjects ||= @elective_group.subjects \
    if params[:elective_group_id]
    @subject.destroy
    redirect_to subjects_path
    flash[:notice] = t('subject_delete')
    flash[:notice] = t('elective_delete') if params[:elective_group_id]
  end

  private

  def set_subject
    if params[:elective_group_id]
      @batch = Batch.shod(params[:batch_id])
      @elective_group = ElectiveGroup.shod(params[:elective_group_id])
      @subject = @elective_group.subjects.shod(params[:id])
    else
      @batch = Batch.shod(params[:batch_id])
      @subject = @batch.subjects.shod(params[:id])
    end
  end

  def subject_params
    params.require(:subject).permit!
  end
end
