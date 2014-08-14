class CreateGradingLevels < ActiveRecord::Migration
  def change
    create_table :grading_levels do |t|
      t.string     :name
      t.references :batch, index: true
      t.integer    :min_score
      t.integer    :order
      t.boolean    :is_deleted, :default => false
      t.string     :description
      t.timestamps
    end
  end
end
