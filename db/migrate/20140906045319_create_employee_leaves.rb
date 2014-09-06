class CreateEmployeeLeaves < ActiveRecord::Migration
  def change
    create_table :employee_leaves do |t|

      t.timestamps
    end
  end
end
