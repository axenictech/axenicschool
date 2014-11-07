class FinanceController < ApplicationController

  def transaction_category
    @transaction_categories=FinanceTransactionCategory.all
  end

  def new_transaction_category
    @transaction_category=FinanceTransactionCategory.new
  end

  def create_transaction_category
    @transaction_category=FinanceTransactionCategory.new(transaction_category_params)       
    if @transaction_category.save
       flash[:notice] = "Transaction category successfully created..."
    end
    @transaction_categories=FinanceTransactionCategory.all
  end

  def edit_transaction_category
    @transaction_category=FinanceTransactionCategory.find(params[:id])
  end
  
  def update_transaction_category
    @transaction_category=FinanceTransactionCategory.find(params[:id])
    if @transaction_category.update(transaction_category_params)
      flash[:notice] = "Transaction category successfully updated..."
    end
    @transaction_categories=FinanceTransactionCategory.all
  end

  def delete_transaction_category
    @transaction_category=FinanceTransactionCategory.find(params[:id])
    if @transaction_category.destroy
      flash[:notice] = "Transaction category successfully deleted..."
    end
    @transaction_categories=FinanceTransactionCategory.all
  end

  def donation
    @donation=FinanceDonation.new
  end

  def create_donation
    @donation=FinanceDonation.new(donation_params)
    if @donation.save
      @donation.create_transaction
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
      @donation.update_transaction
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
    if @asset.update(asset_params)
      flash[:notice]="Asset updated successfully"
    end
  end

  def delete_asset
    @assets=Asset.all
    @asset=Asset.find(params[:id])
    if @asset.destroy
      flash[:notice]="Asset deleted successfully"
    end
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
    if @liability.save
      flash[:notice]="Liability created successfully"
    end
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
    if @liability.update(liability_params)
      flash[:notice]="Liability updated successfully"
    end
  end

  def delete_liability
    @liabilities=Liability.all
    @liability=Liability.find(params[:id])
    if @liability.destroy
      flash[:notice]="Liability deleted successfully"
    end
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
    if @automatic_transaction.save
      flash[:notice]="Automatic transaction created successfully"
    end 
    @automatic_transactions=FinanceTransactionTrigger.all
  end
  
  def edit_automatic_transaction
    @automatic_transaction=FinanceTransactionTrigger.find(params[:id])
    @categories=FinanceTransactionCategory.all
  end

  def update_automatic_transaction
    @automatic_transaction=FinanceTransactionTrigger.find(params[:id])
    if @automatic_transaction.update(auto_transaction_params)
      flash[:notice]="Automatic transaction updated successfully"
    end 
    @automatic_transactions=FinanceTransactionTrigger.all
  end

  def delete_automatic_transaction
    @automatic_transaction=FinanceTransactionTrigger.find(params[:id])
    if @automatic_transaction.destroy
      flash[:notice]="Automatic transaction deleted successfully"
    end 
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
    unless @start_date.nil?
      @end_date=params[:expense][:end_date].to_date
      unless @end_date.nil?
        @expenses=FinanceTransaction.where(transaction_date:@start_date..@end_date)
      else
        flash[:alert]="Please select end date"
        render 'view_expense'
      end
    else
      flash[:alert]="Please select start date"
      render 'view_expense'
    end
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
    unless @start_date.nil?
      @end_date=params[:income][:end_date].to_date
      unless @end_date.nil?
        @incomes=FinanceTransaction.where(transaction_date:@start_date..@end_date)
      else
        flash[:alert]="Please select end date"
        render 'view_income'
      end
    else
      flash[:alert]="Please select start date"
      render 'view_income'
    end
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
    unless @start_date.nil?
      @end_date=params[:transaction][:end_date].to_date
      unless @end_date.nil?
        @categories=FinanceTransactionCategory.all
      else
        flash[:alert]="Please select end date"
        render 'transaction_report'
      end
    else
      flash[:alert]="Please select start date"
      render 'transaction_report'
    end
  end

  def expense_details
    @start_date=params[:start_date].to_date
    @end_date=params[:end_date].to_date
    @category=FinanceTransactionCategory.find(params[:category])
    @expenses=@category.finance_transactions.where(transaction_date:@start_date..@end_date)
    render 'expense_list'
  end

  def income_details
    @start_date=params[:start_date].to_date
    @end_date=params[:end_date].to_date
    @category=FinanceTransactionCategory.find(params[:category])
    @incomes=@category.finance_transactions.where(transaction_date:@start_date..@end_date)
    render 'income_list'
  end

  def finance_transaction_report
    @general_setting=GeneralSetting.first
    @start_date=params[:start_date].to_date
    @end_date=params[:end_date].to_date
    @categories=FinanceTransactionCategory.all
    render 'finance_transaction_report',layout:false
  end

  def transactions_comparison
    @start_date1=params[:transaction][:start_date1].to_date
    @end_date1=params[:transaction][:end_date1].to_date
    @start_date2=params[:transaction][:start_date2].to_date
    @end_date2=params[:transaction][:end_date2].to_date
    unless @start_date1.nil? or @start_date2.nil?
      unless @end_date1.nil? or @end_date2.nil?
        @categories=FinanceTransactionCategory.all
      else
        flash[:alert]="Please select end date"
        render 'compare_report'
      end
    else
      flash[:alert]="Please select start date"
      render 'compare_report'
    end
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
    @master_category=FinanceFeeCategory.new(fee_category_params)
    if @master_category.save
      if params[:batches].present?
          params[:batches].each do |batch|
            BatchesFinanceFeeCategory.create(batch_id:batch,finance_fee_category_id:@master_category.id)
          end
      end
      flash[:notice]="Finance fee category created successfully"
    end
  end

  def fees_list
    @batch=Batch.find(params[:batch][:id])
    @master_categories=@batch.finance_fee_categories.all
  end

  def edit_master_category
    @batch=Batch.find(params[:batch_id])
    @master_category=FinanceFeeCategory.find(params[:id])
  end

  def update_master_category
    @batch=Batch.find(params[:batch_id])
    @master_category=@batch.finance_fee_categories.find(params[:id])
     if @master_category.update(fee_category_params)
        flash[:notice]="Finance fee category updated successfully"
     end
    @master_categories=@batch.finance_fee_categories.all
  end
  
  def delete_master_category
    @batch=Batch.find(params[:batch_id])
    @master_category=@batch.finance_fee_categories.find(params[:id])
    if @master_category.destroy
      flash[:notice]="Finance fee category deleted successfully"
    end
    @master_categories=@batch.finance_fee_categories.all
  end

  def new_fees_particular
    @fee=FinanceFeeParticular.new
    @categories=FinanceFeeCategory.all
  end

  def category_batch
    @master_category=FinanceFeeCategory.find(params[:id])
    @batches=@master_category.batches
  end

  def create_fees_particular
    batches=params[:batches]
    @categories=FinanceFeeCategory.all
    @fee=FinanceFeeParticular.new(fee_particular_params)
    error=false
      if batches.present?
        batches.each do |b|
          if params[:mode]=="admission_no"
            @fee.admission_no=params[:admission_no]
            @fee.batch_id=b
          elsif params[:mode]=="category"
            @fee.category_id=params[:category][:id]
            @fee.batch_id=b
          else
            @fee.batch_id=b
          end
          unless @fee.save
            error=true
          end
        end
        unless error==true
          flash[:notice]="Finance fee particular created successfully"
          redirect_to finance_master_fees_path
        else
          render 'new_fees_particular'
        end
      else
        flash[:alert]="Please select batch..."
        render 'new_fees_particular'
      end
  end

  def master_category_particular
    @batch=Batch.find(params[:batch_id])
    @master_category=FinanceFeeCategory.find(params[:id])
    @particular_fees=@master_category.finance_fee_particulars.where(batch_id:@batch.id)
  end

  def new_particular_fee
    @batch=Batch.find(params[:batch_id])
    @master_category=FinanceFeeCategory.find(params[:id])
    @fee=FinanceFeeParticular.new
  end

  def student_admission_no
    @master_category=FinanceFeeCategory.find(params[:id])
    @fee=FinanceFeeParticular.new
  end

  def student_category
    @master_category=FinanceFeeCategory.find(params[:id])
    @fee=FinanceFeeParticular.new
  end

  def create_particular_fee
    @batch=Batch.find(params[:batch_id])
    @master_category=FinanceFeeCategory.find(params[:id])
    @particular_fees=@master_category.finance_fee_particulars.where(batch_id:@batch.id)
    @fee=@master_category.finance_fee_particulars.new(fee_particular_params)
      if params[:mode]=="admission_no"
          @fee.admission_no=params[:admission_no]
          @fee.batch_id=@batch.id
      elsif params[:mode]=="category"
            @fee.category_id=params[:category][:id]
            @fee.batch_id=@batch.id
      else
            @fee.batch_id=@batch.id
      end
    if @fee.save
      flash[:notice]="Finance fee particulars created successfully"
    end
  end

  def edit_particular_fee
    @batch=Batch.find(params[:batch_id])
    @master_category=FinanceFeeCategory.find(params[:master_id])
    @fee=@master_category.finance_fee_particulars.find(params[:id])
  end

  def update_particular_fee
    @batch=Batch.find(params[:batch_id])
    @master_category=FinanceFeeCategory.find(params[:master_id])
    @particular_fees=@master_category.finance_fee_particulars.where(batch_id:@batch.id)
    @fee=@master_category.finance_fee_particulars.find(params[:id])
    if @fee.update(fee_particular_params)
      flash[:notice]="Finance fee particulars updated successfully"
    end
  end

  def delete_particular_fee
    @batch=Batch.find(params[:batch_id])
    @master_category=FinanceFeeCategory.find(params[:master_id])
    @particular_fees=@master_category.finance_fee_particulars.where(batch_id:@batch.id)
    @fee=@master_category.finance_fee_particulars.find(params[:id])
    if @fee.destroy
      flash[:notice]="Finance fee particulars deleted successfully"
    end      
  end

  def new_fee_discount
    @discount=FeeDiscount.new
    @categories=FinanceFeeCategory.all
  end

  def discount_type
    @type=params[:type]
  end

  def create_fee_discount
    batches=params[:batches]
    @categories=FinanceFeeCategory.all
    @discount=FeeDiscount.new(fee_discount_params)
    error=false
      if batches.present?
        batches.each do |b|
          if @discount.type=="Student"
            @discount.admission_no=params[:admission_no]
            @discount.batch_id=b
          elsif @discount.type=="Student Category"
            @discount.category_id=params[:category][:id]
            @discount.batch_id=b
          else
            @discount.batch_id=b
          end
          unless @discount.save
            error=true
          end
        end
        unless error==true
          flash[:notice]="Finance fee discount created successfully"
          redirect_to finance_new_fee_discount_path
        else
          render 'new_fee_discount'
        end
      else
        flash[:alert]="Please select batch..."
        render 'new_fee_discount'
      end
  end

  def fee_category
    @batch=Batch.find(params[:id])
    @categories=@batch.finance_fee_categories.all
  end

  def discount_view
    @batch=Batch.find(params[:batch_id])
    @master_category=FinanceFeeCategory.find(params[:id])
    @discounts=@master_category.fee_discounts.where(batch_id:@batch.id)
  end

  def edit_fee_discount
    @batch=Batch.find(params[:batch_id])
    @master_category=FinanceFeeCategory.find(params[:master_id])
    @discount=@master_category.fee_discounts.find(params[:id])
  end

  def update_fee_discount
    @batch=Batch.find(params[:batch_id])
    @master_category=FinanceFeeCategory.find(params[:master_id])
    @discount=@master_category.fee_discounts.find(params[:id])
    if @discount.update(fee_discount_params)
     flash[:notice]="Finance fee discount updated successfully"     
    end
    @discounts=@master_category.fee_discounts.where(batch_id:@batch.id)
  end

  def delete_fee_discount
    @batch=Batch.find(params[:batch_id])
    @master_category=FinanceFeeCategory.find(params[:master_id])
    @discount=@master_category.fee_discounts.find(params[:id])
    if @discount.destroy
      flash[:notice]="Finance fee discount deleted successfully"     
    end
    @discounts=@master_category.fee_discounts.where(batch_id:@batch.id)
  end

  def new_fee_collection
    @collection=FinanceFeeCollection.new
    @categories=FinanceFeeCategory.all
  end

  def create_fee_collection
    @collection=FinanceFeeCollection.new(collection_params)
    @master_category=@collection.finance_fee_category
    batches=params[:batches]
    error=false
    if batches.present?
      batches.each do |b|
        @collection.batch_id=b
        unless @collection.save
          error=true
        else
          @collection.create_collection_particular(b,@master_category)
          @collection.create_fee_collection_discount(b,@master_category)
        end
      end
      unless error==true
        flash[:notice]="Finance fee collection created successfully"
        redirect_to finance_new_fee_collection_path
      else
        @categories=FinanceFeeCategory.all
        render 'new_fee_collection'
      end
    else
      @categories=FinanceFeeCategory.all
      flash[:alert]="Please select batch..."
      render 'new_fee_collection'
    end
  end
  
  def view_fee_collection
    @batch=Batch.find(params[:id])
    @collections=@batch.finance_fee_collections.all   
  end

  def edit_fee_collection
    @batch=Batch.find(params[:batch_id])
    @collections=@batch.finance_fee_collections.all 
    @collection=@batch.finance_fee_collections.find(params[:id])
  end

  def update_fee_collection
    @batch=Batch.find(params[:batch_id])
    @collections=@batch.finance_fee_collections.all 
    @collection=@batch.finance_fee_collections.find(params[:id])
    if @collection.update(collection_params)    
      flash[:notice]="Finance fee collection updated successfully"     
    end
  end

  def delete_fee_collection
    @batch=Batch.find(params[:batch_id])
    @collections=@batch.finance_fee_collections.all 
    @collection=@batch.finance_fee_collections.find(params[:id])
    if @collection.destroy   
       flash[:notice]="Finance fee collection deleted successfully"     
    end
  end

  def collection_details_view
     @collection=FinanceFeeCollection.find(params[:id])
     @particulars=@collection.fee_collection_particulars
     @discounts=@collection.fee_collection_discounts
  end

  def fees_submission_batch
    @batches=Batch.all
    @collections=Batch.first.finance_fee_collections
  end

  def fee_collection_date
    @batch=Batch.find(params[:id])
    @collections=@batch.finance_fee_collections.all
  end

  def student_fees
    @collection=FinanceFeeCollection.find(params[:id])
    @category=@collection.finance_fee_category
    @finance_fees=@collection.finance_fees
    @student=@finance_fees.first.student
    @previous=@finance_fees.find_by_student_id(@student.id).id-1
    @next=@finance_fees.find_by_student_id(@student.id).id+1
    @fee=@finance_fees.find_by_student_id(@student.id)
    @particulars=@collection.fee_collection_particulars
    @discounts=@collection.fee_collection_discounts
    @transactions=@fee.finance_transactions
    @fines=@fee.finance_fines
  end

  def student_fees_details
    @collection=FinanceFeeCollection.find(params[:id])
    @category=@collection.finance_fee_category
    @finance_fees=@collection.finance_fees
    @finance_fee=@finance_fees.find(params[:finance_fee_id])
    @student=@finance_fee.student
    @previous=@finance_fees.find_by_student_id(@student.id).id-1
    if @student.id==@finance_fees.last.student.id
       @previous-=1
    end
    @next=@finance_fees.find_by_student_id(@student.id).id+1
    @fee=@finance_fees.find_by_student_id(@student.id)
    @particulars=@collection.fee_collection_particulars
    @discounts=@collection.fee_collection_discounts
    @transactions=@fee.finance_transactions
    @fines=@fee.finance_fines
  end

  def pay_fine
    @student_fine=FinanceFee.find(params[:finance_fee_id])
    @student_fine.create_fine(params[:fine])
    @collection=FinanceFeeCollection.find(params[:id])
    @category=@collection.finance_fee_category
    @finance_fees=@collection.finance_fees
    @finance_fee=@finance_fees.find(params[:finance_fee_id])
    @student=@finance_fee.student
    @previous=@finance_fees.find_by_student_id(@student.id).id-1
    if @student.id==@finance_fees.last.student.id
       @previous-=1
    end
    @next=@finance_fees.find_by_student_id(@student.id).id+1
    @fee=@finance_fees.find_by_student_id(@student.id)
    @particulars=@collection.fee_collection_particulars
    @discounts=@collection.fee_collection_discounts
    @transactions=@fee.finance_transactions
    @fines=@fee.finance_fines
  end
  
  def pay_fee
    @student_fee=FinanceFee.find(params[:finance_fee_id])
    fine=false
    @student_fee.create_transaction(params[:amount],fine)
    if params[:amount]==params[:pay_amount]
       @student_fee.update(is_paid:true)
    end
    @collection=FinanceFeeCollection.find(params[:id])
    @category=@collection.finance_fee_category
    @finance_fees=@collection.finance_fees

    @finance_fee=@finance_fees.find(params[:finance_fee_id])
    @student=@finance_fee.student
    @previous=@finance_fees.find_by_student_id(@student.id).id-1
    
    if @student.id==@finance_fees.last.student.id
       @previous-=1
    end
    
    @next=@finance_fees.find_by_student_id(@student.id).id+1
    @fee=@finance_fees.find_by_student_id(@student.id)
    @particulars=@collection.fee_collection_particulars
    @discounts=@collection.fee_collection_discounts
    @transactions=@fee.finance_transactions
    @fines=@fee.finance_fines
  end

  def student_fee_receipt
    @general_setting=GeneralSetting.first
    @collection=FinanceFeeCollection.find(params[:id])
    @category=@collection.finance_fee_category
    @finance_fees=@collection.finance_fees
    @finance_fee=@finance_fees.find(params[:finance_fee_id])
    @student=@finance_fee.student
    @fee=@finance_fees.find_by_student_id(@student.id)
    @particulars=@collection.fee_collection_particulars
    @discounts=@collection.fee_collection_discounts
    @fines=@fee.finance_fines
    render 'student_fee_receipt',layout:false 
  end

  def search_student
    @students=Student.where("concat_ws(' ',first_name,last_name)like '#{params[:search]}%' 
        OR concat_ws(' ',last_name,first_name)like '#{params[:search]}%' OR admission_no like '#{params[:search]}%'")     
  end

  def fees_collection_student
    @student=Student.find(params[:id])
    @collections=@student.finance_fee_collections
  end

  def student_fees_submission
    @student=Student.find(params[:student_id])
    @collection=FinanceFeeCollection.find(params[:collection_id])
    @category=@collection.finance_fee_category
    @finance_fees=@collection.finance_fees
    @fee=@finance_fees.find_by_student_id(@student.id)
    @particulars=@collection.fee_collection_particulars
    @discounts=@collection.fee_collection_discounts
    @transactions=@fee.finance_transactions
    @fines=@fee.finance_fines
  end

  def student_search
    @students=Student.where("concat_ws(' ',first_name,last_name)like '#{params[:search]}%' 
        OR concat_ws(' ',last_name,first_name)like '#{params[:search]}%' OR admission_no like '#{params[:search]}%'")     
  end

  def fee_collection_structure
    @student=Student.find(params[:id])
    @collections=@student.finance_fee_collections
  end

  def student_fees_structure
    @student=Student.find(params[:student_id])
    @collection=FinanceFeeCollection.find(params[:collection_id])
    @category=@collection.finance_fee_category
    @particulars=@collection.fee_collection_particulars
    @discounts=@collection.fee_collection_discounts
  end

  def fee_structure
    @general_setting=GeneralSetting.first
    @student=Student.find(params[:student_id])
    @collection=FinanceFeeCollection.find(params[:collection_id])
    @category=@collection.finance_fee_category
    @particulars=@collection.fee_collection_particulars
    @discounts=@collection.fee_collection_discounts
    render 'fee_structure',layout:false
  end

  def fees_defaulters
    @courses=Course.all
    @batches=Course.first.batches
    @collections=Batch.first.finance_fee_collections
  end

  def batch_choice
    @course=Course.find(params[:id])
    @batches=@course.batches
  end

  def collection_choice
    @batch=Batch.find(params[:id])
    @collections=@batch.finance_fee_collections
  end

  def defaulter_students
    @collection=FinanceFeeCollection.find(params[:id])
    @students=@collection.students
  end

  def fees_defaulters_list
    @general_setting=GeneralSetting.first
    @collection=FinanceFeeCollection.find(params[:id])
    @students=@collection.students
    render 'fees_defaulters_list',layout:false
  end

  def pay_fees_defaulters
    @student=Student.find(params[:student_id])
    @collection=FinanceFeeCollection.find(params[:collection_id])
    @category=@collection.finance_fee_category
    @finance_fees=@collection.finance_fees
    @fee=@finance_fees.find_by_student_id(@student.id)
    @particulars=@collection.fee_collection_particulars
    @discounts=@collection.fee_collection_discounts
    @transactions=@fee.finance_transactions
    @fines=@fee.finance_fines
  end

  def approve_monthly_payslip
    @salary_months=MonthlyPayslip.select(:salary_date).distinct
  end

  def approve_salary
    @salary_months=MonthlyPayslip.where(salary_date:params[:date])
    @salary=@salary_months.first
    @date=params[:date]
  end

  def approve
    @salary_months=MonthlyPayslip.where(salary_date:params[:date])
    @salary_months.each do |s|
      s.approve_salary
    end
    flash[:notice]='Payslip has been approved'
    redirect_to finance_approve_monthly_payslip_path
  end

  def view_monthly_payslip
    @departments=EmployeeDepartment.all
    @salary_months=MonthlyPayslip.select(:salary_date).distinct
  end

  def view_payslip
    @payslips=[]
    @department=EmployeeDepartment.find(params[:payslip][:department])
    @date=params[:payslip][:date]
    @employees=@department.employees
    unless @employees.nil?
      @employees.each do |e|
        salary=e.monthly_payslips.find_by_salary_date(@date)
        unless salary.nil?
          @payslips<<salary
        end
      end
    end
  end

  def employee_monthly_payslip
    @general_setting=GeneralSetting.first
    @payslips=params[:payslips]
    render 'employee_monthly_payslip',layout:false
  end

  def view_employee_payslip
    @employee=Employee.find(params[:id])
    @date=params[:date]
    @structures=@employee.employee_salery_structures
    @salary=@employee.monthly_payslips.find_by_salary_date(@date)
    @individual_salary=@employee.individual_payslip_categories.find_by_salary_date(@date)
  end

  def employee_payslip
    @general_setting=GeneralSetting.first
    @employee=Employee.find(params[:id])
    @date=params[:date]
    @structures=@employee.employee_salery_structures
    @salary=@employee.monthly_payslips.find_by_salary_date(@date)
    @individual_salary=@employee.individual_payslip_categories.find_by_salary_date(@date)
    render 'employee_payslip',layout:false
  end
private 
  def transaction_category_params
    params.require(:finance_transaction_category).permit!
  end

  def donation_params
    params.require(:finance_donation).permit!
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

  def fee_category_params
    params.require(:finance_fee_category).permit!  
  end

  def fee_particular_params
    params.require(:finance_fee_particular).permit!
  end

  def fee_discount_params
    params.require(:fee_discount).permit!
  end

  def collection_params
    params.require(:finance_fee_collection).permit!
  end
end
