class WeekdaysController < ApplicationController
  def index
    @weekday = Weekday.new
    @day = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)
    @days = %w(0 1 2 3 4 5 6)
    authorize! :create, @weekday
    
  end

  def create
    @day = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)
    @days = %w(0 1 2 3 4 5 6)

    @batch = params[:weekday][:batch_id]

    @batch = @batch = Batch.find(params[:weekday][:batch_id])
    week = []
    week = params[:weekdays]

    @weekdays = Weekday.where(batch_id: @batch.id)
    unless @weekdays.nil?
      @weekdays.destroy_all
    end
    week.each  do |w|
      divas = @day[w.to_i]
      weekday = Weekday.new(batch_id: @batch.id, weekday: divas)
      weekday.save
    end
    flash[:notice] = 'Weekday created successfully......'
  end

  def select
    @day = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)
    @days = %w(0 1 2 3 4 5 6)
    @batch = Batch.find(params[:batch][:id])
    authorize! :read, Weekday
  end
end
