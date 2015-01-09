# finance helper
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

  def collect_category
    @categories.collect { |c| [c.name, c.id] }
  end

  def discount_error!
    return if @discount.errors.empty?
    messages = @discount.errors.full_messages.map { |m| content_tag(:li, m) }.join
    html = <<-HTML
     <div class="alert alert-danger alert-dismissable">
      <ul>#{messages}</ul>
     </div>
    HTML
    html.html_safe
  end

  def collect_category1
    @categories.collect { |c| [c.name, c.id] }
  end

  def collect_fee
    @categories.collect { |c| [c.name, c.id] }
  end

  def collect_fee_sub_batch
  	@batches.collect { |b| [b.course.course_name + ' ' + b.course.section_name + '-' + b.name, b.id] }
  end

  def collect_fee_date
    @collections.collect { |c| [c.name + ' ' + c.created_at.to_date.to_s, c.id] }
  end

  def collection_date
    @collections.uniq.collect { |c| [c.name + ' ' + c.created_at.to_date.to_s, c.id] }
  end

  def collection_structure
  	@collections.uniq.collect { |c| [c.name + ' ' + c.created_at.to_date.to_s, c.id] }
  end

  def collect_fee_course
    @courses.collect { |c| [c.course_name, c.id] }
  end

  def collect_batch_choice
    @batches.collect { |b| [b.course.course_name + ' ' + b.name, b.id] }
  end

  def collect_collection_date
    @collections.collect { |c| [c.name + ' ' + c.created_at.to_date.to_s, c.id] }
  end

  def transaction_errors!
    return if @transaction.errors.empty?
    messages = @transaction.errors.full_messages.map { |m| content_tag(:li, m) }.join
    html = <<-HTML
     <div class="alert alert-danger alert-dismissable">
      <ul>#{messages}</ul>
    </div>
    HTML
    html.html_safe
  end

  def income_errors!
    return if @transaction.errors.empty?
    messages = @transaction.errors.full_messages.map { |m| content_tag(:li, m) }.join
    html = <<-HTML
     <div class="alert alert-danger alert-dismissable">
      <ul>#{messages}</ul>
    </div>
    HTML
    html.html_safe
  end

  def donation_errors!
     return if @donation.errors.empty?
    messages = @donation.errors.full_messages.map { |m| content_tag(:li, m) }.join
    html = <<-HTML
     <div class="alert alert-danger alert-dismissable">
      <ul>#{messages}</ul>
    </div>
    HTML
    html.html_safe
  end
end
