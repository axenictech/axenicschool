class ClassTimingsController < ApplicationController

	def index
		@batches=Batch.all
	end

	 def new

    	@batch=Batch.find(params[:batch_id])
	    @class_timing = ClassTiming.new
	    @class_timing1=@batch.class_timings.build
	 end

	 def create
    	@batch=Batch.find(params[:batch_id])
        @class_timings=@batch.class_timings.all
    	@class_timing1=@batch.class_timings.new(params_class)
    	 @class_timing1.save
    	
    end

     def destroy
        @batch=Batch.find(params[:batch_id])
        @class_timings=@batch.class_timings.all
        @class_timing1=@batch.class_timings.find(params[:id])
        @class_timing1.destroy
        
        
    end

    def edit
        @batch=Batch.find(params[:batch_id])
        @class_timing1=@batch.class_timings.find(params[:id])
    end
    def update
        @batch=Batch.find(params[:batch_id])
        @class_timings=@batch.class_timings.all
        @class_timing1=@batch.class_timings.find(params[:id])
        @class_timing1.update(params_class)
        

    end

	 def select
        
         @batch=Batch.find(params[:batch][:id])
         @class_timings=@batch.class_timings.all

     end

      private
    def params_class
    	params.require(:class_timing).permit(:name,:start_time,:end_time,:is_break)
    end
end
