class BatchTransfersController < ApplicationController
  
  def index
     @courses=Course.all
     @course=Course.new
        
  end
  def show
     @course = Course.find(params[:id])
     render :layout=>false
  end
  
  def transfer
      @batch=Batch.find(params[:format])
      @batchs=Batch.all
      
 
  end

  def graduation
     @batch=Batch.find(params[:format])
  end
end