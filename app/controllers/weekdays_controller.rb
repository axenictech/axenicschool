class WeekdaysController < ApplicationController

	def index
		@weekday=Weekday.new
		@day = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    	@days = ["0", "1", "2", "3", "4", "5", "6"]
	end

	def create

		@day = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
		@days = ["0", "1", "2", "3", "4", "5", "6"]

		  @batch = params[:weekday][:batch_id]
		
		@batch = @batch=Batch.find(params[:weekday][:batch_id])
		  week=[]
		  week=params[:weekdays]

		@weekdays=Weekday.where(batch_id:@batch.id)
		unless @weekdays.nil?
			@weekdays.destroy_all
		end
    	week.each  do |w|
		 	divas =@day[w.to_i]
			weekday= Weekday.new(:batch_id => @batch.id, :weekday=>divas)
     		weekday.save
	    end
        flash[:notice]="Weekday created successfully......"
	end

	def select
		@day = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    	@days = ["0", "1", "2", "3", "4", "5", "6"]
    	@batch=Batch.find(params[:batch][:id])
	end

	
end
