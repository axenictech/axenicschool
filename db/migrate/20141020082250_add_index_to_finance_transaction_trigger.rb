class AddIndexToFinanceTransactionTrigger < ActiveRecord::Migration
  def change
  	add_column :finance_transaction_triggers,:category_id,:integer
  	add_index :finance_transaction_triggers,:category_id
  end
end
