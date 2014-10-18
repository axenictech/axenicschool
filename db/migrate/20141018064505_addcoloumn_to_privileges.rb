class AddcoloumnToPrivileges < ActiveRecord::Migration
  def change
  	 add_column :privileges, :privilege_tag_id, :int
     add_column :privileges, :priority, :int
     add_index :privileges, :privilege_tag_id
  end
end
