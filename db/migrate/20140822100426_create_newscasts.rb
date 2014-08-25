class CreateNewscasts < ActiveRecord::Migration
  def change
    create_table :newscasts do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
