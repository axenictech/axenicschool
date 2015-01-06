module ExamGroupsHelper
  def courses
    return if @courses.empty?
    @courses.collect { |b| [b.full_name, b.id] }
  end

  def batches_present
    return if @batches.any?
    'No recorde found'
  end

  def exam_groups_present
    return if @exam_groups.any?
    'No recorde found'
  end
end
