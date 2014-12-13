class GradingLevelsController < ApplicationController
  def index
    @batches = Batch.all
    authorize! :read, @batches.first
  end

  def new
    @batch = Batch.find(params[:batch_id])
    @grading_level = GradingLevel.new
    @grading_level1 = @batch.grading_levels.build
    authorize! :create, @grading_level
  end

  def create
    @batch = Batch.find(params[:batch_id])
    @grading_levels = @batch.grading_levels.all
    @grading_level1 = @batch.grading_levels.new(params_grade)
    flash[:grading_level_notice] = 'Grade created successfully'
    @grading_level1.save
  end

  def edit
    @batch = Batch.find(params[:batch_id])
    @grading_level1 = @batch.grading_levels.find(params[:id])
    authorize! :update, @grading_level1
  end

  def update
    @batch = Batch.find(params[:batch_id])
    @grading_levels = @batch.grading_levels.all
    @grading_level1 = @batch.grading_levels.find(params[:id])
    flash[:grading_level_notice] = 'Grade updated successfully'
    @grading_level1.update(params_grade)
  end

  def destroy
    authorize! :create, @grading_level
    @batch = Batch.find(params[:batch_id])
    @grading_levels = @batch.grading_levels.all
    @grading_level1 = @batch.grading_levels.find(params[:id])
    flash[:grading_level_notice] = 'Grade deleted successfully'
    @grading_level1.destroy
  end

  def select
    @batch = Batch.find(params[:batch][:id])
    @grading_levels = @batch.grading_levels.all
    authorize! :read, @batch
  end

  private

  def params_grade
    params.require(:grading_level).permit(:name, :min_score, :description)
  end
end
