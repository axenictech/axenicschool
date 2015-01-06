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

  def subject_data
    @subjects ||= @batch.normal_subjects
    @elective_groups ||= @batch.elective_groups
  end

  def subject
    @batch = Batch.shod(params[:batch_id])
    subject_data
    authorize! :read, @batch
  end

  def new
    @batch = Batch.shod(params[:batch_id])
    @subject = @batch.subjects.build
    new2(params[:elective_group_id])
    authorize! :create, @subject
  end

  def new2(eg_id)
    @elective_group = ElectiveGroup.shod(eg_id) if eg_id
    @subject = @elective_group.subjects.build if eg_id
  end

  def create
    @batch = Batch.shod(params[:batch_id])
    subject_data
    @subject = @batch.subjects.new(subject_params)
    create2(params[:elective_group_id])
    flash[:notice] = t('subject_create')
  end

  def create2(eg_id)
    @elective_group = ElectiveGroup.shod eg_id if eg_id
    @subject = @elective_group.subjects.new(subject_params) if eg_id
    @elective_subjects ||= @elective_group.subjects if eg_id
    @subject.save
    @subject.update(batch_id: @batch.id) if eg_id
    flash[:notice] = t('elective_create') if eg_id
  end

  def edit
    authorize! :update, @subject
  end

  def update
    subject_data
    @elective_subjects ||= @elective_group.subjects \
    if params[:elective_group_id]
    @subject.update(subject_params)
    flash[:notice] = t('subject_update')
    flash[:notice] = t('elective_update') if params[:elective_group_id]
  end

  def destroy
    authorize! :delete, @subject
    subject_data
    @elective_subjects ||= @elective_group.subjects \
    if params[:elective_group_id]
    destroy2
  end

  def destroy2
    @subject.destroy
    redirect_to subjects_path
    flash[:notice] = t('subject_delete')
    flash[:notice] = t('elective_delete') if params[:elective_group_id]
  end

  private

  def set_subject
    if params[:elective_group_id]
      set_subject2(params[:batch_id], params[:elective_group_id], params[:id])
    else
      set_subject3(params[:batch_id], params[:id])
    end
  end

  def set_subject2(batch, elective, id)
    @batch = Batch.shod(batch)
    @elective_group = ElectiveGroup.shod(elective)
    @subject = @elective_group.subjects.shod(id)
  end

  def set_subject3(batch, id)
    @batch = Batch.shod(batch)
    @subject = @batch.subjects.shod(id)
  end

  def subject_params
    params.require(:subject).permit!
  end
end
