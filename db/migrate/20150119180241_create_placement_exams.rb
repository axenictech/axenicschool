class CreatePlacementExams < ActiveRecord::Migration
  def change
    create_table :placement_exams do |t|
      t.references :question_type, index: true
      t.time :timeperiod
      t.date :start_date
      t.date :end_date
      t.references :company, index: true

      t.timestamps
    end
  end
end
