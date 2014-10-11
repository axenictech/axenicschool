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
  	@finance_donations = FinanceDonation.order(created_at: :desc)
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
    if @asset.is_inactive
      @active="inactive"
    end

    flash[:notice5] = "Asset updated successfully"
 end

  def destroy_asset
    @assets=Asset.order(created_at: :asc)
    @asset=Asset.find(params[:id])
    if @asset.destroy
    flash[:notice5] = "Asset deleted successfully"
    
  end

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
    if @liability.is_solved
      @solved="issolved"
    end
    flash[:notice7] = "Liability updated successfully"
  end

  def destroy_liability
      @liabilities=Liability.order(created_at: :asc)
   @liability=Liability.find(params[:id])
    if @liability.destroy
    flash[:notice7] = "Liability deleted successfully"
    end
end

  def add_liability
      @liability=Liability.new
  end

  def add
    @amount=params[:emp][:amount]
    p "pppppppp"
    p @amount
    redirect_to employees_admission1_path
  end

  def disp
    @emp=Employee.new    
  end
  def new_automatic_transaction
    @automatic_transactions=FinanceTransactionTrigger.order(title: :asc)  
  end

  def create_automatic_transaction
    
    @automatic_transaction=FinanceTransactionTrigger.new(finance_transaction_trigger_params)
    if @automatic_transaction.save
      flash[:notice8] = "Automatic transaction created successfully"
    end
    @automatic_transactions=FinanceTransactionTrigger.order(title: :asc)
    
  end

<<<<<<< HEAD
  def fees_index
    
  end

=======

  def display_automatic_transaction
      @automatic_transactions=FinanceTransactionTrigger.order(title: :asc)
  end

  def edit_automatic_transaction
      @automatic_transaction=FinanceTransactionTrigger.find(params[:automatic_transaction_id])
  end

  def update_automatic_transaction
>>>>>>> e6b6662dbbc2a3decea899e2cdca1ad43f2ee221
    
      @automatic_transaction=FinanceTransactionTrigger.find(params[:automatic_transaction_id])
      if @automatic_transaction.update(finance_transaction_trigger_params)
        flash[:notice8] = "Automatic transaction updated successfully"
      end
        @automatic_transactions=FinanceTransactionTrigger.order(title: :asc)
  end

  def destroy_automatic_transaction
    @automatic_transactions=FinanceTransactionTrigger.order(title: :asc)
    @automatic_transaction=FinanceTransactionTrigger.find(params[:id])
    if @automatic_transaction.destroy
      flash[:notice8] = "Automatic transaction deleted successfully"
    end
      @automatic_transactions=FinanceTransactionTrigger.order(title: :asc)
      
  end


	private
	def finance_fee_category_params
		params.require(:finance_fee_category).permit(:name, :description, :is_master)
	end

	def finance_donation_params
		params.require(:finance_donation).permit(:donor, :description, :amount, :finance_transaction_id)
	end

  def asset_params
    params.require(:asset).permit(:title, :description, :amount, :is_inactive)
    
  end

  def liability_params
     params.require(:liability).permit(:title, :description, :amount, :is_solved)
  end
  def finance_transaction_trigger_params
     params.require(:finance_transaction_trigger).permit(:finance_fee_category_id, :percentage, :title, :description)
  end

end
  