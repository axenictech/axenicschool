class CreatePrivileges < ActiveRecord::Migration
  def change
    create_table :privileges do |t|
      t.string :name
      t.references :school_id
      t.timestamps
    end
  end
end
