class CreateTimeTableEntries < ActiveRecord::Migration
  def change
    create_table :time_table_entries do |t|
      t.references :batch,index:true
      t.references :week_day,index:true
      t.references :class_timing,index:true
      t.references :subject,index:true
      t.references :employee,index:true
      
      t.timestamps
    end
  end
end
