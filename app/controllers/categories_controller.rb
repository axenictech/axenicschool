class CategoriesController < ApplicationController
	def index
     @category = Category.new
     @categorys = Category.all
  end

  def create
        @categorys = Category.all
   	 @category = Category.new(category_params)
   	  if @category.save
         redirect_to categories_path
       else
      	  render 'index'
       end
      
   end
   
  
   def edit
    @category = Category.find(params[:id])
   end

   def update
      @category = Category.find(params[:id])
  
         if @category.update(category_params)
           redirect_to  categories_path(@category)
          else
           render 'index'
         end
     end
   
   def destroy
     @category = Category.find(params[:id])
     @category.destroy
     redirect_to  categories_path
  end


  private
     def category_params
      params.require(:category).permit(:name)
    end
end
