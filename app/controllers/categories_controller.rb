# Categories Controller
class CategoriesController < ApplicationController
  before_filter :find_category, only: [:edit, :update, :destroy]
  def index
    @category = Category.new
    @categorys ||= Category.all
    authorize! :create, @category
  end

  def create
    @categorys ||= Category.all
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = t('category_create')
      redirect_to categories_path
    else
      render 'index'
    end
  end

  def edit
    authorize! :update, @category
  end

  def update
    @category.update(category_params)
    flash[:notice] = t('category_update')
  end

  def destroy
    authorize! :delete, @category
    @category.destroy
    flash[:notice] = t('category_delete')
    redirect_to categories_path
  end

  private

  def find_category
    @category = Category.shod(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
