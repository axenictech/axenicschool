class CreateGradinglevles < ActiveRecord::Migration
  def change
    create_table :gradinglevles do |t|
      t.string :name
      t.integer :min_score
      t.string :description

      t.timestamps
    end
  end
end
