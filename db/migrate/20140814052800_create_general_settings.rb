class CreateGeneralSettings < ActiveRecord::Migration
  def change
    create_table :general_settings do |t|
    	 t.string :InstitutionName
      t.string :InstitutionAddress
      t.string :InstitutionPhoneNo
      t.string :StudentAttendanceType
      t.date :Finance_start_year_date
      t.date :Finance_end_year_date
      t.string :Language
      t.string :TimeZone
      t.string :Country
      t.string :NetworkState
      t.string :IncludeGradingSystem
      t.integer :AddmissionNumberAutoIncreament
      t.integer :EmployeeNumberAutoIncreament
      t.string :EnableNewsCommentModeration
      t.attachment :image
      
      t.timestamps
    end
    create_default
  end
  def create_default
   GeneralSetting.create :InstitutionName=>""
  end

end
