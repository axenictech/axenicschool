module ExamsHelper
  def exam_error_messages!
    return  if @exam.errors.empty?

    messages = @exam.errors.full_messages.map { |m| content_tag(:li, m) }.join

    html = <<-HTML
    <div class="alert alert-danger alert-dismissable">
      <ul align="left">#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end

  def errors_messages!
    return  if @errors.empty?

    messages = @errors.errors.full_messages.map { |m| content_tag(:li, m) }.join

    html = <<-HTML
    <div class="alert alert-danger alert-dismissable">
      <ul align="left">#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end
end
