class CreatePrivilegesUsers < ActiveRecord::Migration
  def change
    create_table :privileges_users do |t|

      t.timestamps
    end
  end
end
