# Time Table Model
class TimeTable < ActiveRecord::Base
  has_many :time_table_entries, dependent: :destroy
  scope :shod, ->(id) { where(id: id).take }

  def self.time_table_date(timetable)
    TimeTable.where('time_tables.start_date <= ?
      AND time_tables.end_date >= ?', timetable, timetable)
  end


  def create_time_table(t)
    error = false
    previous = TimeTable.where('end_date >= ? AND start_date <= ?', t.start_date, t.start_date)
    unless previous.empty?
      error = true
      t.errors.add(:start_date, 'is within the range of another timetable')
    end
    foreword = TimeTable.where('end_date >= ? AND start_date <= ?', t.end_date, t.end_date)
    unless foreword.empty?
      error = true
      t.errors.add(:end_date, 'is within the range of another timetable')
    end
    fully_overlapping = TimeTable.where('end_date <= ? AND start_date >= ?', t.end_date, t.start_date)
    unless fully_overlapping.empty?
      error = true
      t.errors.add(:end_date, 'timetable_in_between_given_dates')
    end
    if t.end_date < t.start_date
      error = true
      t.errors.add(:end_date, "can't be less than start date")
    end
    error
   end

  def self.tte_for_the_day(batch, date)
    entries = TimeTableEntry.joins(:time_table, :class_timing, :weekday).where('
    time_tables.start_date<= ? AND time_tables.end_date >=?
    AND time_table_entries.batch_id = ?', date, date, batch.id)
    if entries.empty?
      today = []
    else
      today = entries.select { |a| a.weekday.day_of_week == date.wday }
    end
    today
  end
end
