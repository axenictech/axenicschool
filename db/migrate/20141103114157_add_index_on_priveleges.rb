class AddIndexOnPriveleges < ActiveRecord::Migration
  def change
  	add_column :privileges,:privilege_tag_id,:integer
  	add_index :privileges,:privilege_tag_id
  end
end
