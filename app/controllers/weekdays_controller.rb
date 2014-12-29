class WeekdaysController < ApplicationController
  def index
    @weekday = Weekday.new
    @day = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)
    @days = %w(0 1 2 3 4 5 6)
    authorize! :create, @weekday

    @weekdays = Batch.includes(:course).all
  end

  def create
    @day = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)
    @days = %w(0 1 2 3 4 5 6)
    @batch = params[:weekday][:batch_id]
    @batch = Batch.find(params[:weekday][:batch_id])
    week = params[:weekdays]
    @weekdays = Weekday.batchid(@batch)
    @week = Weekday.deleteweek(@weekdays)
    @weekday = Weekday.saveweek(week, @day, @batch)
    flash[:notice] = 'Weekday created successfully......'
  end

  def select
    @day = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)
    @days = %w(0 1 2 3 4 5 6)
    @batch = Batch.find(params[:batch][:id])
    authorize! :read, Weekday
  end
end
