class CreateFinanceTransactions < ActiveRecord::Migration
  def change
    create_table :finance_transactions do |t|
      t.string     :title
      t.string     :description
      t.decimal    :amount
      t.boolean    :fine_included, :default => false
      t.references :student,index:true
      t.references :finance_fees,index:true

      t.timestamps
    end
  end
end
