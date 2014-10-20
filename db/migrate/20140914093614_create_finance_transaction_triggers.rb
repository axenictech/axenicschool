class CreateFinanceTransactionTriggers < ActiveRecord::Migration
  def change
    create_table :finance_transaction_triggers do |t|
      t.decimal    :percentage
      t.string     :title
      t.string     :description

      t.timestamps
    end
  end
end
