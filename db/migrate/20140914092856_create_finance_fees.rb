class CreateFinanceFees < ActiveRecord::Migration
  def change
    create_table :finance_fees do |t|
      t.references :fee_collection,index:true
      t.string :transaction_id
      t.references :student,index:true

      t.timestamps
    end
  end
end
