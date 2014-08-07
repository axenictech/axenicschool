class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string :name
      t.decimal :start_date
      t.decimal :end_date
      t.boolean :is_deleted
      t.integer :employee_id
      t.references :course, index: true

      t.timestamps
    end
  end
end
