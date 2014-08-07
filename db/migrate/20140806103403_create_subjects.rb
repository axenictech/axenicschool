class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :code
      t.integer :max_weekily_classes
      t.decimal :credit_hours
      t.boolean :no_exams

      t.timestamps
    end
  end
end
