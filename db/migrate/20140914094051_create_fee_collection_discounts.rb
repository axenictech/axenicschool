class CreateFeeCollectionDiscounts < ActiveRecord::Migration
  def change
    create_table :fee_collection_discounts do |t|
      t.string     :type
      t.string     :name
      t.references :receiver,index:true
      t.references :finance_fee_collection,index:true
      t.decimal    :discount
      t.boolean    :is_amount, :default=> false

      t.timestamps
    end
  end
end
