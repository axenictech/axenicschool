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
      
 
  end

  def graduation
     @batch=Batch.find(params[:batch_id])
  end
end