class CreateGeneralSettings < ActiveRecord::Migration
  def change
    create_table :general_settings do |t|
    	t.string :institution_name 
    	t.string :institution_address
    	t.string :institution_phone_no
    	t.string :student_attendance_type
    	t.string :language
    	t.string :time_zone
    	t.string :country
    	t.string :network_state

      t.timestamps
    end
  end
end
