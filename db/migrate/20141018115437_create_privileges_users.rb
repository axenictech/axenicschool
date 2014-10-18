class CreatePrivilegesUsers < ActiveRecord::Migration
  def change
    create_table :privileges_users do |t|
      t.integer :school_id
      t.integer :user_id
      t.references :privilege_id
      t.references :course, index: true
      t.timestamps
    end
  end
end
