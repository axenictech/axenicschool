class TimeTablesController < ApplicationController

	
	def new
 		 @batches=Batch.all
	end

	def select
	    @batch = Batch.find(params[:batch][:id])
	    @subjects = @batch.subjects.all
        
	end

	def sub
  		 @subject=@batch.subjects.find(params[:subject][:id])
	end

	def timetable
		@batches=Batch.all
		#@today = params[:next].to_date
		
	end
end
