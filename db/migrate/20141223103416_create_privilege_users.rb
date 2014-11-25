class CreatePrivilegeUsers < ActiveRecord::Migration
  def change
    create_table :privilege_users do |t|
      t.references :privilege_tag, index:true
      t.references :privilege, index:true
      t.references :user, index:true
      t.timestamps
    end
  end
end
