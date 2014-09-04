class TimeTableEntriesController < ApplicationController
def index
  	@batches=Batch.all
  	 @sub=params[:sub_id]
  	 @times=params[:time_id]
end

def select
	    @batch = Batch.find(params[:batch][:id])
	    @subjects = @batch.subjects.all
        
end
def subs
   @subject=@batch.subjects.find(params[:subject][:id])
end
end
