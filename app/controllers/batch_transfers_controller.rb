class BatchTransfersController < ApplicationController
  
  def index
     @courses=Course.all
     @course=Course.new
        
  end
  def select
     @course = Course.find(params[:batch_transfer][:id])

  end
  
  def transfer
      @batch=Batch.find(params[:batch_id])
      @batchs=Batch.all
      @students=@batch.students.all
 
  end

  def graduation
     @batch=Batch.find(params[:batch_id])
  end

  def assign_all
    @batch=Batch.find(params[:format])
    @students=@batch.students.all
  end

   def remove_all
    @batch=Batch.find(params[:format])
    @students=@batch.students.all
  end

   def student_transfer

  end

end