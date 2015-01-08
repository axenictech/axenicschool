module ExamSettingHelper
  def class_designation!
    return if @class_dess.any?
    html = <<-HTML
    <tr><th colspan="3">
    <center>No record found.</center></th></tr>
    HTML
    html.html_safe
  end
end
