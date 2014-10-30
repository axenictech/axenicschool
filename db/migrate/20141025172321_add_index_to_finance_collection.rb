class AddIndexToFinanceCollection < ActiveRecord::Migration
  def change
  	add_column :finance_fee_collections,:finance_fee_category_id,:integer
  	add_index :finance_fee_collections,:finance_fee_category_id
  end
end
