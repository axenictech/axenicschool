class AddindexToFinanecTransactionCategory < ActiveRecord::Migration
  def change
  	add_column :finance_transactions,:finance_transaction_category_id,:integer
  	add_index :finance_transactions,:finance_transaction_category_id
  end
end
