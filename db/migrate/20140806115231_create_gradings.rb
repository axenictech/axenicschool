class CreateGradings < ActiveRecord::Migration
  def change
    create_table :gradings do |t|
      t.string :name

      t.timestamps
    end
  end
end
