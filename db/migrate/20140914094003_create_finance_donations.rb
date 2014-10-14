class CreateFinanceDonations < ActiveRecord::Migration
  def change
    create_table :finance_donations do |t|
      t.string     :donor
      t.string     :description
      t.decimal    :amount
      t.references :finance_transaction,index:true

      t.timestamps
    end
  end
end
