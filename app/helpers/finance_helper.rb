module FinanceHelper
	def fee_errors!
    return if @fee.errors.empty?
    messages = @fee.errors.full_messages.map { |m| content_tag(:li, m) }.join
    html = <<-HTML
     <div class="alert alert-danger alert-dismissable">
      <ul>#{messages}</ul>
    </div>
    HTML
    html.html_safe
  end
end
