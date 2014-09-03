class EventsController < ApplicationController



def new
	@event=Event.new
	@start_date=params[:format]
end

def create
   @event=Event.new(params_event) 
   @event.save
   redirect_to event_path(@event)
end

def show
	@event=Event.find(params[:id])
	@batches=Batch.all

end

	private
	def params_event
	  params.require(:event).permit(:start_date,:end_date,:title,:description,:is_holiday,:is_common)
	end
end