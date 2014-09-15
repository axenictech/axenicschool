 class OnlineExamsController < ApplicationController
  def  new
    @online=OnlineExam.new
    @batches=Batch.all

  end
  def create
    @online=OnlineExam.new(online_params)
    @online.save
     batches=params[:batches]
     batches.each  do |batch|
            @online_exam_batch=BatchesOnlineExam.new(online_exam_id:@online.id,batch_id: batch)
            @online_exam_batch.save
            
     end
     redirect_to  online_exams_queAns_path(@online)
  end

  
  def queAns
   
     @online_exam=OnlineExam.find(params[:online_exam_id])
     @que=OnlineExamQuestion.new

  end

  def createQue
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
  end
  
   def update
      @online_exam=OnlineExam.find(params[:id])
      if @online_exam.update(online_params)
         flash[:notice] = 'Exam was successfully updated!'
         redirect_to online_exams_onlineView_path(@online_exam)
      else
         flash[:notice] = 'Exam was unable to updated!'
         redirect_to online_exams_onlineView_path(@online_exam)
      end
   end

   def  editQue
     @queedit=OnlineExamQuestion.find(params[:online_examque_id])
   end
    
    def updateQue
        @queedit=OnlineExamQuestion.find(params[:online_examque_id])
        @queedit.update(que_params)
        redirect_to  online_exams_display_path(@queedit.online_exam)
    end
    
    def editOption
       @optionedit=OnlineExamQuestion.find(params[:online_examque_id])
    end

    def updateOption
        @optionedit=OnlineExamQuestion.find(params[:online_examque_id])
        @optionedit.update(que_params)
          redirect_to  online_exams_display_path(@optionedit.online_exam)
    end
  
    def select
       @batch = Batch.find(params[:batch][:id])
    end
  
    def destroy
      @batch = Batch.find(params[:batch_id])
      @online_exam=OnlineExam.find(params[:id])
      @online_exam.destroy
       
    end

    def assign_all
      @batches=Batch.all
    end

    def remove_all
      @batches=Batch.all
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
       params.require(:online_exam_question).permit(:question,:marks,:is_answer,:option_group, :online_exam_id)
    end
end
