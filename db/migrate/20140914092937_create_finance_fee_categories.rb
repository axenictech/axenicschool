class CreateFinanceFeeCategories < ActiveRecord::Migration
  def change
    create_table :finance_fee_categories do |t|
      t.string      :name
      t.text        :description
      t.references  :batch,index:true
      t.references  :fee_collection,index:true
      t.boolean     :is_deleted, :default => false
      t.boolean     :is_master, :default => false
      
      t.timestamps
    end
  end
end
