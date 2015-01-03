# Course Helper
module CoursesHelper
  def course_error!
    return if @course.errors.empty?
    messages = @course.errors.full_messages.map { |m| content_tag(:li, m) }.join
    html = <<-HTML
     <div class="alert alert-danger alert-dismissable">
      <ul>#{messages}</ul>
    </div>
    HTML
    html.html_safe
  end
end
