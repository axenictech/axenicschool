class CalenderController < ApplicationController
 
  def index
      @show_month = Date.today
      @start_date = @show_month.beginning_of_month
      @start_date_day = @start_date.wday
      @last_day = @show_month.end_of_month
  end

  def change
    @show_month=params[:format].to_date
    @start_date = @show_month.beginning_of_month
    @start_date_day = @start_date.wday
    @last_day = @show_month.end_of_month
  end

  def event_view
      @event=Event.find(params[:event_id])
  end

end