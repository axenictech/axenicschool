class CreateWeights < ActiveRecord::Migration
  def change
    create_table :weights do |t|
      t.integer :percentage
      t.references :PlacementExam, index: true
      t.references :QuestionType, index: true
      t.timestamps
    end
  end
end
