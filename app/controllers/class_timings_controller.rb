# class timings controller
class ClassTimingsController < ApplicationController
  before_filter :find_batch, except: [:index, :select]
  def index
    @batches ||= Batch.includes(:course).all
    authorize! :read, ClassTiming
  end

  def new
    @class_timing = ClassTiming.new
    @class_timing1 = @batch.class_timings.build
    authorize! :create, @class_timing
  end

  def create
    @class_timings ||= @batch.class_timings
    @class_timing1 = @batch.class_timings.new(params_class)
    @class_timing1.save
    flash[:notice] = t('class_timing_create')
  end

  def destroy
    @class_timing1 = @batch.class_timings.shod(params[:id])
    authorize! :destroy, @class_timing1
    @class_timing1.destroy
    flash[:notice] = t('class_timing_delete')
    redirect_to class_timings_path
  end

  def edit
    @class_timing1 = @batch.class_timings.shod(params[:id])
    authorize! :update, @class_timing1
  end

  def update
    @class_timings ||= @batch.class_timings.all
    @class_timing1 = @batch.class_timings.shod(params[:id])
    @class_timing1.update(params_class)
    flash[:notice] = t('class_timing_update')
  end

  def select
    @batch = Batch.shod(params[:batch][:id])
    @class_timings ||= @batch.class_timings
    authorize! :read, @class_timings.first
  end

  private

  def find_batch
    @batch = Batch.shod(params[:batch_id])
  end

  def params_class
    params.require(:class_timing).permit!
  end
end
