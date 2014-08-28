class CreateAttendences < ActiveRecord::Migration
  def change
    create_table :attendences do |t|

      t.references :student,index:true
      t.references :time_table_entry,index:true
      t.boolean :forenoon, :default => false
      t.boolean :afternoon, :default => false
      t.string :reason
      
      t.timestamps
    end
  end
end
