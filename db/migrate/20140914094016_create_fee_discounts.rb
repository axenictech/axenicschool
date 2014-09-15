class CreateFeeDiscounts < ActiveRecord::Migration
  def change
    create_table :fee_discounts do |t|
      t.string     :type
      t.string     :name
      t.references :receiver,index:true
      t.references :finance_fee_category,index:true
      t.decimal    :discount
      t.boolean    :is_amount, :default=> false

      t.timestamps
    end
  end
end
