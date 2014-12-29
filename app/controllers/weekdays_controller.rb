# Weekdays Controller
class WeekdaysController < ApplicationController
  def index
    @weekday = Weekday.new
    @day ||= Weekday.day
    @days ||= Weekday.days
    @weekdays ||= Batch.includes(:course).all
    authorize! :create, @weekday
  end

  def create
    @day ||= Weekday.day
    @days ||= Weekday.days
    @batch = Weekday.set_day(params[:weekday][:batch_id], params[:weekdays])
    flash[:notice] = t('weekday_create')
  end

  def select
    @day ||= Weekday.day
    @days ||= Weekday.days
    @batch = Batch.shod(params[:batch][:id])
    authorize! :read, Weekday
  end
end
