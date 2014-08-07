class CreateElectivegroups < ActiveRecord::Migration
  def change
    create_table :electivegroups do |t|
      t.string :name

      t.timestamps
    end
  end
end
