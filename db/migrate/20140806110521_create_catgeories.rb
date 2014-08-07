class CreateCatgeories < ActiveRecord::Migration
  def change
    create_table :catgeories do |t|
      t.string :name
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
