# Company Controller
class CompaniesController < ApplicationController
  before_action :set_companies, only: [:edit, :update, :destroy]
  def index
    @company = Company.new
    @companies = Company.all
  end

  def create
    @companies = Company.all
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path
    else
      render 'index'
    end
  end
  
  def edit
  end

  def update
    @companies.update(company_params)
    flash[:notice] = t('placement_news_update')
  end

  def destroy
    @companies.destroy
    redirect_to companies_path
    flash[:notice] = t('placement_news_destroyed')
  end
  
  private
  
  def set_companies
    @companies = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :criteria)
  end
end
