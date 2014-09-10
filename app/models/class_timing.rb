class ClassTiming < ActiveRecord::Base
	has_many :timetable_entries
    belongs_to :batch
   
    validates :name, presence: true,length:{minimum:1, maximum:20}, format:{ with: /\A[a-zA-Z0-9" "-]+\Z/}
    validates :start_time, presence: true
    validates :end_time, presence: true
    validate  :end_time_cannot_be_less_than_start_time
   
    def end_time_cannot_be_less_than_start_time
      if end_time.present? and end_time < start_time
      errors.add(:end_time, "can't be less than start time")
      end
  end
  
end
