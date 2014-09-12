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
  	
      # if session[:all] == true
       # @batches = Batch.pluck(:id) 
       # else
     batches=params[:batches]
  	  # end 
     batches.each  do |batch|
            @online_exam_batch=BatchesOnlineExam.new(online_exam_id:@online.id,batch_id: batch)
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
         @online=@queAns.online_exam
         redirect_to  online_exams_queAns_path(@online)


  end

  def onlineView
     @batches=Batch.all
  end


  def edit
    
    @online_exam=OnlineExam.find(params[:id])
    @batches=Batch.all
    # @online_exams=@online_exam.batches.find(params[:id])

  
  end


   
  def select
     @batch = Batch.find(params[:batch][:id])

   end
  
   def assign_all
      
      @batches=Batch.all
       # session[:all] = true

  end

  def remove_all
      @batches=Batch.all
       # session[:all] = false
  end

  def display
     @online_exam=OnlineExam.find(params[:online_exam_id])
     @online_que=@online_exam.online_exam_questions.all
  end


  private
  def online_params
      params.require(:online_exam).permit(:name,:start_date,:end_date,:maximum_time,:percentage,:option_per_question)
  end


  def que_params
      params.require(:online_exam_question).permit(:question,:marks,:is_answer,:option_group,:online_exam_id)
  end
end
