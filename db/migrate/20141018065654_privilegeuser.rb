class Privilegeuser < ActiveRecord::Migration
  def change
  	create_table :privileges_users do |t|
    	 t.integer :school_id
    	 t.integer :user_id
    	 t.integer :privilege_id
         t.timestamps
    end
      add_index :privileges_users,:school_id
      add_index :privileges_users,:user_id
      add_index :privileges_users,:privilege_id
  end
end
