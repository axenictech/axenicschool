# TimeTable Entries Helper
module TimeTableEntriesHelper
  def collect_batch
    return if @batches.empty?
    @batches.collect { |b| [b.full_name, b.id] }
  end

  def collect_subject
    return if @subjects.empty?
    @subjects.collect { |b| [b.name, b.id] }
  end

  def present_time_table_entry(c, w, t)
    TimeTableEntry.where(class_timing_id: c.id, weekday_id: w.id\
      , time_table_id: t).take
  end
end
