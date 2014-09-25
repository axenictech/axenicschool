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

def select_subject
	 
	 @subject=Subject.find(params[:subject][:subject_id])
     @teachers= EmployeeSubject.where(subject_id: @subject.id)
    
end


end
