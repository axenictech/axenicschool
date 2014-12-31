# Events Controller
class EventsController < ApplicationController
  def new
    @event = Event.new
    @start_date = params[:format]
    authorize! :create, @event
  end

  def create
    @event = Event.new(params_event)
    @event.save
    redirect_to event_path(@event)
  end

  def show
    @event = Event.shod(params[:id])
    @batches ||= Batch.all
    authorize! :read, @event
  end

  def showdep
    @departments ||= EmployeeDepartment.all
    authorize! :create, Event
  end

  def update
    @event = Event.shod(params[:event_id])
    @event.create_to_all
    redirect_to calender_index_path
  end

  private

  def params_event
    params.require(:event).permit!
  end
end