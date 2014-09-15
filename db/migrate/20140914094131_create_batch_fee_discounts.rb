class CreateBatchFeeDiscounts < ActiveRecord::Migration
  def change
    create_table :batch_fee_discounts do |t|

      t.timestamps
    end
  end
end
