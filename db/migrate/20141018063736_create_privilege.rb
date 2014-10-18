class CreatePrivilege < ActiveRecord::Migration
  def change
    create_table :privileges do |t|
    	 t.string :name
         t.timestamps
    end
      add_column :privileges, :school_id, :int
      add_index :privileges, :school_id
  end
end
