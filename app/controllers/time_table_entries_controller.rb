class TimeTableEntriesController < ApplicationController
def index
  @batches=Batch.all
end

def select
	    @batch = Batch.find(params[:batch][:id])
	    @subjects = @batch.subjects.all
        
end
def sub
   @subject=@batch.subjects.find(params[:subject][:id])
end
end
