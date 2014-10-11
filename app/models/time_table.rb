class TimeTable < ActiveRecord::Base
	has_many :timetable_entries, dependent: :destroy

    # validate :end_date_cannot_be_less_than_start_date
    
  #   def end_date_cannot_be_less_than_start_date
  #     if end_date < start_date
  #     errors.add(:end_date, "can't be less than start date")
  #     end
  # end
end
