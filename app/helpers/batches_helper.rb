module BatchesHelper
  def collect_course
    return if @courses.any?
    @courses.collect { |c| [c.course_name, c.id] }
  end
end
