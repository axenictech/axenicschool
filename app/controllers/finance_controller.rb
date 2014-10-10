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
  
    @asset=Asset.new(asset_params)
    @asset.save   
    flash[:notice4] = "Asset created successfully"
 
  end

  def display_asset
      @assets=Asset.order(created_at: :asc)
  end

  def viewcontent_asset
    @asset=Asset.find(params[:format])
    
  end

  def edit_asset
    @asset=Asset.find(params[:asset_id])
  end

  def update_asset
    @assets=Asset.order(created_at: :asc)
    @asset=Asset.find(params[:asset_id])
    @asset.update(asset_params)
    flash[:notice5] = "Asset updated successfully"
 end

  def destroy_asset
    @assets=Asset.order(created_at: :asc)
    @asset=Asset.find(params[:id])
    if @asset.destroy
    flash[:notice5] = "Asset deleted successfully"
    redirect_to finance_display_asset_path(@asset)
  end
<<<<<<< HEAD
  end
  def new_liability
    @liability=Liability.new
  end
  
  def create_liability
    @liability=Liability.new(liability_params)
    @liability.save   
    flash[:notice6] = "Liability created successfully"
  end

  def display_liability
      @liabilities=Liability.order(created_at: :asc)
  end

  def viewcontent_liability
    @liability=Liability.find(params[:format])
  end

  def edit_liability
    @liability=Liability.find(params[:liability_id])
  end

  def update_liability
      @liabilities=Liability.order(created_at: :asc)
    @liability=Liability.find(params[:liability_id])
    @liability.update(liability_params)
    flash[:notice7] = "Liability updated successfully"
  end

  def destroy_liability
      @liabilities=Liability.order(created_at: :asc)
   @liability=Liability.find(params[:id])
    if @liability.destroy
    flash[:notice7] = "Liability deleted successfully"
    redirect_to finance_display_liability_path(@asset)
    end
=======

  def add_liability
      @liability=Liability.new
>>>>>>> 865a34e87f74fbb26d40b2b4fb334496706c7a85
  end

  def add
    @amount=params[:emp][:amount]
    p "pppppppp"
    p @amount
    redirect_to employees_admission1_path
  end

<<<<<<< HEAD
  
=======
  def create_liability
     @liability=Liability.new(liability_params)
     @liability.save
  end

>>>>>>> 865a34e87f74fbb26d40b2b4fb334496706c7a85
  def disp
    @emp=Employee.new    
  end
  def new_automatic_transaction
    @automatic_transactions=FinanceTransactionTrigger.all   
  end

  def create_automatic_transaction
    @automatic_transactions=FinanceTransactionTrigger.all
    @automatic_transaction=FinanceTransactionTrigger.new(finance_transaction_trigger_params)
    @automatic_transaction.save
    
  end

<<<<<<< HEAD
  def display_automatic_transaction
      @automatic_transactions=FinanceTransactionTrigger.all
  end

  def edit_automatic_transaction
      @automatic_transaction=FinanceTransactionTrigger.find(params[:automatic_transaction_id])
  end

  def update_automatic_transaction
    @automatic_transactions=FinanceTransactionTrigger.all
      @automatic_transaction=FinanceTransactionTrigger.find(params[:automatic_transaction_id])
      @automatic_transaction.update(finance_transaction_trigger_params)
  end

=======
>>>>>>> 865a34e87f74fbb26d40b2b4fb334496706c7a85
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
  