class AddTransactionDateToFinanceTransaction < ActiveRecord::Migration
  def change
  	add_column :finance_transactions,:transaction_date,:date
  end
end
