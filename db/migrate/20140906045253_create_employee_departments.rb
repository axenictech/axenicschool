class CreateEmployeeDepartments < ActiveRecord::Migration
  def change
    create_table :employee_departments do |t|
      t.string  :code
      t.string  :name
      t.string :status
      
      t.timestamps
    end
  end
end
