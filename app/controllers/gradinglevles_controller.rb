class GradinglevlesController < ApplicationController
 
  		def index
  			
  		end
  	
  		def new
  				
  				@gradinglevle=Gradinglevle.new
  				@gradinglevles=Gradinglevle.all
  				
  		end

      def show
      end
  		
      def create
          @gradinglevles=Gradinglevle.all
  				@gradinglevle = Gradinglevle.new(gradinglevle_params)
   				if @gradinglevle.save
  				    redirect_to new_gradinglevle_path
          else
             render 'new'
          end       
		end

		def edit
      
      		@gradinglevle=Gradinglevle.find(params[:id])
    	end

		def update
  				@gradinglevle = Gradinglevle.find(params[:id])
 				if @gradinglevle.update(gradinglevle_params)
    				redirect_to new_gradinglevle_path
  				else
    				render 'edit'
  				end
		end

		def destroy
 			 @gradinglevle = Gradinglevle.find(params[:id])
 			 @gradinglevle.destroy
 			 redirect_to new_gradinglevle_path
		end

		private
  		def gradinglevle_params
    		params.require(:gradinglevle).permit(:name, :min_score,:description)
  		end
end
