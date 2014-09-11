 class OnlineExamsController < ApplicationController
  def index
  end

  def  new
  	@online=OnlineExam.new
  	@batches=Batch.all

  end
  def create
  	@online=OnlineExam.new(online_params)
  	@online.save
  	
     if session[:all] == true
      @batches = Batch.pluck(:id) 
      else
     @batches=params[:batches]
  	 end 
     @batches.each  do |batch|
            @online_exam_batch=BatchOnlineExam.new(online_exam_id:@online.id,batch_id: batch)
            @online_exam_batch.save
            
     end
     redirect_to  online_exams_queAns_path(@online)
  end

  
  def queAns
   
     @online_exam=OnlineExam.find(params[:format])
      @que=OnlineExamQuestion.new

  end

  def createQue
    # option=[]
    # option=params[:online_exam_question][:option_group]
     
    # option<<params[:option_group]
     # p option
        @queAns=OnlineExamQuestion.new(que_params)
        @queAns.save
    
    redirect_to  online_exams_path

  end

  
   def assign_all
      
      @batches=Batch.all
      session[:all] = true

  end

  def remove_all
      @batches=Batch.all
      session[:all] = false
  end


  private
  def online_params
      params.require(:online_exam).permit(:name,:start_date,:end_date,:maximum_time,:percentage,:option_per_question)
  end


  def que_params
      params.require(:online_exam_question).permit(:question,:marks,:is_answer,:option_group,:online_exam_id)
  end
end
