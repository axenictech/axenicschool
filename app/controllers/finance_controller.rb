class FinanceController < ApplicationController

  def transaction_category
    @transaction_categories=FinanceTransactionCategory.all
  end

  def new_transaction_category
    @transaction_category=FinanceTransactionCategory.new
  end

  def create_transaction_category
    @transaction_category=FinanceTransactionCategory.new(transaction_category_params)       
    @transaction_category.save
    @transaction_categories=FinanceTransactionCategory.all
  end

  def edit_transaction_category
    @transaction_category=FinanceTransactionCategory.find(params[:id])
  end
  
  def update_transaction_category
    @transaction_category=FinanceTransactionCategory.find(params[:id])
    @transaction_category.update(transaction_category_params)
    @transaction_categories=FinanceTransactionCategory.all
  end

  def delete_transaction_category
    @transaction_category=FinanceTransactionCategory.find(params[:id])
    @transaction_category.destroy
    @transaction_categories=FinanceTransactionCategory.all
  end

  def donation
    @donation=FinanceDonation.new
  end

  def create_donation
    @donation=FinanceDonation.new(donation_params)
    if @donation.save
      flash[:notice]="Donation accepted"
      redirect_to finance_donation_receipt_path(@donation)
    else
      render 'donation'
    end
  end

  def donation_receipt
    @donation=FinanceDonation.find(params[:id])
  end

  def finance_donation_receipt
    @donation=FinanceDonation.find(params[:id])
    @general_setting=GeneralSetting.first
    render 'finance_donation_receipt',layout:false
  end

  def donors
    @donors=FinanceDonation.all
  end

  def edit_donation
    @donation=FinanceDonation.find(params[:id])
  end

  def update_donation
    @donation=FinanceDonation.find(params[:id])
    if @donation.update(donation_params)
      flash[:notice]="Donation updated"
      redirect_to finance_donors_path
    else
      render 'edit_donation'
    end
  end

  def delete_donation
    @donation=FinanceDonation.find(params[:id])
    @donation.destroy
    flash[:notice]="Donation deleted"
    redirect_to finance_donors_path(@donation)
  end

  def new_master_category
  	@master_category=FinanceFeeCategory.new
  	@batches=Batch.all
  end

  def assign_batch
    @batches=Batch.all
  end

  def remove_batch
    @batches=Batch.all
  end

  def create_master_category
    if params[:batches].present?
        params[:batches].each do |batch|
          @batch=Batch.find(batch)
          @master_category=@batch.finance_fee_categories.create(fee_category_params)
        end
    end
  end

  def new_asset
    @asset=Asset.new
  end

  def create_asset
    @assets=Asset.all
    @asset=Asset.new(asset_params)
    if @asset.save
      flash[:notice]="Asset created successfully"
    end
  end

  def view_asset
    @assets=Asset.all
  end

  def edit_asset
    @asset=Asset.find(params[:id])
  end

  def update_asset
    @assets=Asset.all
    @asset=Asset.find(params[:id])
    @asset.update(asset_params)
  end

  def delete_asset
    @assets=Asset.all
    @asset=Asset.find(params[:id])
    @asset.destroy
  end

  def asset_list
    @assets=Asset.all
    @general_setting=GeneralSetting.first
    render 'asset_list',layout:false
  end

  def each_asset_view
    @asset=Asset.find(params[:id])
  end

  def new_liability
    @liability=Liability.new
  end

  def create_liability
    @liability=Liability.new(liability_params)
    @liability.save
    flash[:notice]="Liability created successfully"
  end

  def view_liability
    @liabilities=Liability.all
  end

  def edit_liability
    @liability=Liability.find(params[:id])
  end

  def update_liability
    @liabilities=Liability.all
    @liability=Liability.find(params[:id])
    @liability.update(liability_params)
  end

  def delete_liability
    @liabilities=Liability.all
    @liability=Liability.find(params[:id])
    @liability.destroy
  end

  def each_liability_view
    @liability=Liability.find(params[:id])
  end

  def liability_list
    @liabilities=Liability.all
    @general_setting=GeneralSetting.first
    render 'liability_list',layout:false
  end

  def automatic_transaction
    @automatic_transactions=FinanceTransactionTrigger.all
  end

  def new_automatic_transaction
    @automatic_transaction=FinanceTransactionTrigger.new
    @categories=FinanceTransactionCategory.all
  end

  def create_automatic_transaction
    @automatic_transaction=FinanceTransactionTrigger.new(auto_transaction_params)
    @automatic_transaction.save
    @automatic_transactions=FinanceTransactionTrigger.all
  end
  
  def edit_automatic_transaction
    @automatic_transaction=FinanceTransactionTrigger.find(params[:id])
    @categories=FinanceTransactionCategory.all
  end

  def update_automatic_transaction
    @automatic_transaction=FinanceTransactionTrigger.find(params[:id])
    @automatic_transaction.update(auto_transaction_params)
    @automatic_transactions=FinanceTransactionTrigger.all
  end

  def delete_automatic_transaction
    @automatic_transaction=FinanceTransactionTrigger.find(params[:id])
    @automatic_transaction.destroy
    @automatic_transactions=FinanceTransactionTrigger.all
  end

private 
  def transaction_category_params
    params.require(:finance_transaction_category).permit!
  end

  def donation_params
    params.require(:finance_donation).permit!
  end

  def fee_category_params
    params.require(:finance_fee_category).permit!  
  end

  def asset_params
    params.require(:asset).permit!
  end

  def liability_params
    params.require(:liability).permit!
  end

  def auto_transaction_params
    params.require(:finance_transaction_trigger).permit!
  end
end
