module ExamGroupsHelper
  def courses
    return if @courses.empty?
    @courses.collect { |b| [b.full_name, b.id] }
  end

  def batches_present
    return if @batches.empty?
    'No recorde found'
  end
end
