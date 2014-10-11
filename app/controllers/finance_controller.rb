class FinanceController < ApplicationController
	def new_finance_fee_category
		
		@finance_fee_categories=FinanceFeeCategory.all
	end

	def add_finance_fee_category

		@finance_fee_category=FinanceFeeCategory.new
	end

	def create_finance_fee_category
	
		@finance_fee_category=FinanceFeeCategory.new(finance_fee_category_params)
		if @finance_fee_category.save	
			flash[:notice1] = "Finance category created successfully"
		end
		@finance_fee_categories=FinanceFeeCategory.all
  end

	def edit_finance_fee_category

		@finance_fee_category = FinanceFeeCategory.find(params[:finance_fee_category_id])
	end

	def update_finance_fee_category
  	
 		@finance_fee_category = FinanceFeeCategory.find(params[:finance_fee_category_id])
  	if @finance_fee_category.update(finance_fee_category_params)
  		flash[:notice1] = "Finance category updated successfully"
  	end
  	@finance_fee_categories=FinanceFeeCategory.all
  end

	def destroy_finance_fee_category
   
    @finance_fee_category = FinanceFeeCategory.find(params[:id])
    if @finance_fee_category.destroy
    	flash[:notice1] = "Finance category deleted successfully"
    end
    @finance_fee_categories=FinanceFeeCategory.all
  end

  def new_finance_donation
  	@finance_donation=FinanceDonation.new  		
  end

  def add_finance_donation
  	@finance_donation=FinanceDonation.new(finance_donation_params)	
  	if @finance_donation.save
      flash[:notice2] = "Donation accepted"
      redirect_to finance_disp_finance_donation_path(@finance_donation)
      else
      render 'new_finance_donation'
    end
  end

  def disp_finance_donation
    @finance_donation = FinanceDonation.find(params[:format])
  end
  
  def showall_finance_donation
  	@finance_donations = FinanceDonation.order(created_At: :desc)
  end

  def edit_finance_donation
  	@finance_donation = FinanceDonation.find(params[:finance_donation_id])
  end

  def update_finance_donation
  	
 		@finance_donation = FinanceDonation.find(params[:finance_donation_id])
  	if @finance_donation.update(finance_donation_params)
      flash[:notice3] = "Donation updated successfully"
      redirect_to finance_showall_finance_donation_path(@finance_donation)
      else
      render 'edit_finance_donation'
    end
  end


	def destroy_finance_donation
   
    @finance_donation = FinanceDonation.find(params[:id])
    if @finance_donation.destroy
      flash[:notice3] = "Donation deleted successfully" 
    end
    redirect_to finance_showall_finance_donation_path(@finance_donation)
  end

  def new_asset
    @asset=Asset.new

  end

  def create_asset
    @assets=Asset.order(created_At: :desc) 
    @asset=Asset.new(asset_params)
    @asset.save   
    flash[:notice4] = "Asset created successfully"
 
  end

  def display_asset
      @assets=Asset.order(created_At: :desc)   
  end

  def viewcontent_asset
    @asset=Asset.find(params[:format])
    
  end

  def edit_asset
    @asset=Asset.find(params[:asset_id])
  end

  def update_asset
    @assets=Asset.order(created_At: :desc) 
    @asset=Asset.find(params[:asset_id])
    @asset.update(asset_params)
    flash[:notice5] = "Asset updated successfully"
 end

  def destroy_asset
    @asset=Asset.find(params[:id])
    if @asset.destroy
    flash[:notice5] = "Asset deleted successfully"
    redirect_to finance_display_asset_path(@asset)
  end

  def new_liability
    @li=Liability.new
  end

  def add_liability
      @li=Liability.new(liability_params)
      @li.save
  end

  def add
    @amount=params[:emp][:amount]
    p "pppppppp"
    p @amount
    redirect_to employees_admission1_path
  end

  def create_liability
    #@li=Liability.new
        # @liability.save    
  end
  def disp
    @emp=Employee.new    
  end

  def add_automatic_transaction
    @automatic_transaction=FinanceTransactionTrigger.new    
  end

  def create_automatic_transaction
    @automatic_transaction=FinanceTransactionTrigger.new(finance_transaction_trigger_params)
    @automatic_transaction.save
    
  end

  def fees_index
    
  end

    
end

	private
	def finance_fee_category_params
		params.require(:finance_fee_category).permit(:name, :description, :is_master)
	end

	def finance_donation_params
		params.require(:finance_donation).permit(:donor, :description, :amount)
	end

  def asset_params
    params.require(:asset).permit(:title, :description, :amount, :is_inactive)
    
  end

  def liability_params
     params.require(:liability).permit(:title, :description, :amount)
  end
  def finance_transaction_trigger_params
     params.require(:finance_transaction_trigger).permit(:finance_fee_category_id, :percentage, :title, :description)
  end
end
  