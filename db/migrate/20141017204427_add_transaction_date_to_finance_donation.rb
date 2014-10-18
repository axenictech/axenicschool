class AddTransactionDateToFinanceDonation < ActiveRecord::Migration
  def change
  	add_column :finance_donations,:transaction_date,:date
  end
end
