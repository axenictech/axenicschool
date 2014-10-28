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

  def new_expense
    @transaction=FinanceTransaction.new
    @categories=FinanceTransactionCategory.where(is_income:false)
  end

  def create_expense
    @transaction=FinanceTransaction.new(transaction_params)
    if @transaction.save
      flash[:notice]="Expense has been added to the accounts"
      redirect_to finance_new_expense_path
    else
      @categories=FinanceTransactionCategory.where(is_income:false)
      render 'new_expense'
    end
  end

  def expense_list
    @start_date=params[:expense][:start_date].to_date
    @end_date=params[:expense][:end_date].to_date
    @expenses=FinanceTransaction.where(transaction_date:@start_date..@end_date)
  end

  def edit_expense
    @transaction=FinanceTransaction.find(params[:id])
    @categories=FinanceTransactionCategory.where(is_income:false)
  end

  def update_expense
    @transaction=FinanceTransaction.find(params[:id])
    if @transaction.update(transaction_params)
      flash[:notice]="Expense has been updated to the accounts"
      redirect_to finance_view_expense_path
    else
      @categories=FinanceTransactionCategory.where(is_income:false)
      render 'edit_expense'
    end
  end

  def delete_expense
    @transaction=FinanceTransaction.find(params[:id])
    @transaction.destroy
    flash[:notice]="Expense has been deleted from accounts"
    redirect_to finance_view_expense_path
  end

  def finance_expense_report
    @general_setting=GeneralSetting.first
    @start_date=params[:start_date].to_date
    @end_date=params[:end_date].to_date
    @expenses=FinanceTransaction.where(transaction_date:@start_date..@end_date)
    render 'finance_expense_report',layout:false
  end

  def new_income
    @transaction=FinanceTransaction.new
    @categories=FinanceTransactionCategory.where(is_income:true)
  end

  def create_income
    @transaction=FinanceTransaction.new(transaction_params)
    if @transaction.save
      flash[:notice]="Income has been added to the accounts"
      redirect_to finance_new_income_path
    else
      @categories=FinanceTransactionCategory.where(is_income:true)
      render 'new_income'
    end
  end

  def income_list
    @start_date=params[:income][:start_date].to_date
    @end_date=params[:income][:end_date].to_date
    @incomes=FinanceTransaction.where(transaction_date:@start_date..@end_date)
  end

  def edit_income
    @transaction=FinanceTransaction.find(params[:id])
    @categories=FinanceTransactionCategory.where(is_income:true)
  end

  def update_income
    @transaction=FinanceTransaction.find(params[:id])
    if @transaction.update(transaction_params)
      flash[:notice]="Income has been updated to the accounts"
      redirect_to finance_view_income_path
    else
      @categories=FinanceTransactionCategory.where(is_income:true)
      render 'edit_income'
    end
  end

  def delete_income
    @transaction=FinanceTransaction.find(params[:id])
    @transaction.destroy
    flash[:notice]="Income has been deleted from accounts"
    redirect_to finance_view_income_path
  end

  def finance_income_report
    @general_setting=GeneralSetting.first
    @start_date=params[:start_date].to_date
    @end_date=params[:end_date].to_date
    @incomes=FinanceTransaction.where(transaction_date:@start_date..@end_date)
    render 'finance_income_report',layout:false
  end

  def transactions_list
    @start_date=params[:transaction][:start_date].to_date
    @end_date=params[:transaction][:end_date].to_date
    @transactions=FinanceTransaction.where(transaction_date:@start_date..@end_date)
  end

  def finance_transaction_report
    @general_setting=GeneralSetting.first
    @start_date=params[:start_date].to_date
    @end_date=params[:end_date].to_date
    @transactions=FinanceTransaction.where(transaction_date:@start_date..@end_date)
    render 'finance_transaction_report',layout:false
  end

  def transactions_comparison
    @start_date1=params[:transaction][:start_date1].to_date
    @end_date1=params[:transaction][:end_date1].to_date
    @transactions1=FinanceTransaction.where(transaction_date:@start_date1..@end_date1)
    @start_date2=params[:transaction][:start_date2].to_date
    @end_date2=params[:transaction][:end_date2].to_date
    @transactions2=FinanceTransaction.where(transaction_date:@start_date2..@end_date2)
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

  def transaction_params
    params.require(:finance_transaction).permit!
  end
end
