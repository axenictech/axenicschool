class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
