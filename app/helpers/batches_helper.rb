module BatchesHelper
  def collect_course
    return unless @courses.nil?
    @courses.collect { |c| [c.course_name, c.id] }
  end
end
