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

	def showdep
		@departments=EmployeeDepartment.all
	end

	def update
		event=params[:event_id]
		@event=Event.find(event)
		if @event.is_common?
			Batch.all.each do |batch|
					BatchEvent.create(batch_id:batch.id,event_id:event)
				end
			EmployeeDepartment.all.each do |dept|
					EmployeeDepartmentEvent.create(employee_department_id:dept.id,event_id:event)
				end
		else
			unless params[:batches].nil?
				params[:batches].each do |batch|
					BatchEvent.create(batch_id:batch,event_id:event)
				end
			end
			unless params[:departments].nil?
				params[:departments].each do |dept|
					EmployeeDepartmentEvent.create(employee_department_id:dept,event_id:event)
				end
			end
		end
		redirect_to calender_index_path
	end

	private
	def params_event
	  params.require(:event).permit(:start_date,:end_date,:title,:description,:is_holiday,:is_common)
	end
end