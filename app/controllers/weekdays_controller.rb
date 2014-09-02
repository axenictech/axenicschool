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
		  p @batch
		  week=[]
		  week=params[:weekdays]
		
    		 week.each  do |w|
    		 	divas =@day[w.to_i]
         		@weekday= Weekday.new(:batch_id => @batch, :weekday=>divas)
         		@weekday.save
          end
		  
		  redirect_to weekdays_path
		
	end

	def select
		@day = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    	@days = ["0", "1", "2", "3", "4", "5", "6"]
    	@batch=Batch.find(params[:batch][:id])
	end

	
end
