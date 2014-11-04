class CreatePrivilegesUsers < ActiveRecord::Migration
  def change
    create_table :privileges_users do |t|
      t.references :user,index:true
      t.references :privilege,index:true
      
      t.timestamps
    end
  end
end
