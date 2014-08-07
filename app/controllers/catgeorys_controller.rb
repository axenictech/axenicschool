class CatgeorysController < ApplicationController
   def index
      @category = Catgeory.new
      @categorys = Catgeory.all
   end

   def create
         @categorys = Catgeory.all
    	 @category = Catgeory.new(category_params)
    	  if @category.save
          render 'index'
        else
       	  render 'index'
        end
       
    end
    
   
    def edit
     @category = Catgeory.find(params[:id])
    end

    def update
       @category = Catgeory.find(params[:id])
 
          if @category.update(category_params)
            redirect_to catgeorys_path
           else
            render 'index'
          end
      end
    
    def destroy
      @category = Catgeory.find(params[:id])
      @category.destroy
      redirect_to catgeorys_path
   end


   private
      def category_params
       params.require(:catgeory).permit(:name)
     end
end
