class GradingLevelsController < ApplicationController

def index
		 @batches = Batch.all
		 @batch=Batch.find(params[:batch_id])
		 @grading_levels=@batch.grading_levels.all
		  @grading_level=@batch.grading_levels.build
	end
  
    def new

    	@batch=Batch.find(params[:batch_id])
	    @grading_level = GradingLevel.new
	    @grading_level1=@batch.grading_levels.build
	    
	end
    def create
    	@batch=Batch.find(params[:batch_id])
    	@grading_level=@batch.grading_levels.new(params_grade)
    	if @grading_level.save
    	redirect_to batch_grading_levels_path
        else
            render 'new'
        end
    end

    def edit
    	@batch=Batch.find(params[:batch_id])
<<<<<<< HEAD
    	@grading_level1=@batch.grading_levels.find(params[:id])
=======
    	@grading_level=@batch.grading_levels.find(params[:id])
>>>>>>> bb02eeda859dd434e6da22357404ffc2d94ad70e
    end
    def update
    	@batch=Batch.find(params[:batch_id])
    	@grading_level=@batch.grading_levels.find(params[:id])
    	@grading_level.update(params_grade)
    	redirect_to batch_grading_levels_path

    end

    def destroy
    	@batch=Batch.find(params[:batch_id])
    	@grading_level=@batch.grading_levels.find(params[:id])
    	@grading_level.destroy
    	redirect_to batch_grading_levels_path
    	
    end

    private
    def params_grade
    	params.require(:grading_level).permit(:name,:min_score,:description)
    end
end
