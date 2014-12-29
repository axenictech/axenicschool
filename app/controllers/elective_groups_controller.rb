# Elective group controller
class ElectiveGroupsController < ApplicationController
  before_action :set_elective_group, only: [:edit, :update, :destroy]

  def new
    @batch = Batch.shod params[:batch_id]
    @elective_group = @batch.elective_groups.build
    authorize! :create, @elective_group
  end

  def create
    @batch = Batch.shod(params[:batch_id])
    @subjects ||= @batch.normal_subjects
    @elective_groups ||= @batch.elective_groups
    @elective_group = @batch.elective_groups.new(elective_group_params)
    @elective_group.save
    flash[:notice] = t('elective_group_create')
  end

  def edit
    authorize! :update, @elective_group
  end

  def update
    @subjects ||= @batch.normal_subjects
    @elective_groups ||= @batch.elective_groups
    @elective_group.update(elective_group_params)
    flash[:notice] = t('elective_group_update')
  end

  def destroy
    authorize! :delete, @elective_group
    @subjects ||= @batch.normal_subjects
    @elective_groups ||= @batch.elective_groups
    @elective_group.destroy
    flash[:notice] = t('elective_group_delete')
    redirect_to subjects_path
  end

  def elective_subject
    @elective_group = ElectiveGroup.shod(params[:id])
    @elective_subjects ||= @elective_group.subjects
    authorize! :read, @elective_group
  end

  private

  def set_elective_group
    @batch = Batch.shod(params[:batch_id])
    @elective_group = @batch.elective_groups.shod(params[:id])
  end

  def elective_group_params
    params.require(:elective_group).permit(:name)
  end
end
