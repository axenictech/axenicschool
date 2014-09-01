class CreateWeekdays < ActiveRecord::Migration
  def change
    create_table :weekdays do |t|
      t.references :batch,index:true
      t.string :weekday
      t.timestamps
    end
    create_default
  end

  def create_default
   Weekday.create :batch_id=>"", :weekday=>"1"
   Weekday.create :batch_id=>"", :weekday=>"2"
   Weekday.create :batch_id=>"", :weekday=>"3"
   Weekday.create :batch_id=>"", :weekday=>"4"
   Weekday.create :batch_id=>"", :weekday=>"5"
  end

end
