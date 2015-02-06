class CreateStudentInformations < ActiveRecord::Migration
  def change
    create_table :student_informations do |t|
      t.string :year
      t.decimal :marks
      t.references :student, index: true
      t.references :batch, index: true

      t.timestamps null: false
    end
    add_foreign_key :student_informations, :students
    add_foreign_key :student_informations, :batches
  end
end
