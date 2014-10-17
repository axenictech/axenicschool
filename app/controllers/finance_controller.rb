class FinanceController < ApplicationController


  def new_transaction_category
    @transaction_category=FinanceTransactionCategory.new
  end

  def create_transaction_category
    @transaction_category=FinanceTransactionCategory.new(finance_transaction_category_params)       
    @transaction_category.save
  end

private 
def finance_transaction_category_params
  params.require(:finance_transaction_category).permit(:name,:description,:is_income,:deleted)
end

end
  