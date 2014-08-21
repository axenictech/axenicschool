class CreateNewsComments < ActiveRecord::Migration
  def change
    create_table :news_comments do |t|
      t.text       :content
      t.references :news, index:true

      t.timestamps
    end
  end
end
