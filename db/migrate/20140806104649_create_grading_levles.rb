class CreateGradingLevles < ActiveRecord::Migration
  def change
    create_table :grading_levles do |t|
      t.string :name
      t.integer :min_score
      t.string :description

      t.timestamps
    end
  end
end
