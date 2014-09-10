class CategoriesController < ApplicationController
	def index
     @category = Category.new
     @categorys = Category.all
  end

  def create
        @categorys = Category.all
   	 @category = Category.new(category_params)
   	  if @category.save
         flash[:notice]="Category was successfully created"
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
          flash[:notice]="Category updated successfully"
           redirect_to  categories_path(@category)
          else
           render 'edit'
         end
     end
   
   def destroy
     @category = Category.find(params[:id])
    if @category.destroy
      flash[:notice]="Category deleted successfully "
     redirect_to  categories_path
   else
    flash[:notice]="Category was unable to delete"
      redirect_to  categories_path
  end
  end


  private
     def category_params
      params.require(:category).permit(:name)
    end
end
