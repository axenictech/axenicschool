# finance helper
module FinanceHelper
<<<<<<< HEAD
  def particular_error!
=======
  def fee_errors!
>>>>>>> b96094dbbc906571a04744ef07e3a0a833e26c5e
    return if @fee.errors.empty?
    messages = @fee.errors.full_messages.map { |m| content_tag(:li, m) }.join
    html = <<-HTML
     <div class="alert alert-danger alert-dismissable">
      <ul>#{messages}</ul>
    </div>
    HTML
    html.html_safe
  end

<<<<<<< HEAD
  def collection_error!
    return if @collection.errors.empty?
    messages = @collection.errors.full_messages.map { |m| content_tag(:li, m) }.join
    html = <<-HTML
     <div class="alert alert-danger alert-dismissable">
      <ul>#{messages}</ul>
    </div>
    HTML
    html.html_safe
=======
  def collect_category
    @categories.collect { |c| [c.name, c.id] }
>>>>>>> b96094dbbc906571a04744ef07e3a0a833e26c5e
  end

  def discount_error!
    return if @discount.errors.empty?
    messages = @discount.errors.full_messages.map { |m| content_tag(:li, m) }.join
    html = <<-HTML
     <div class="alert alert-danger alert-dismissable">
      <ul>#{messages}</ul>
<<<<<<< HEAD
    </div>
=======
     </div>
>>>>>>> b96094dbbc906571a04744ef07e3a0a833e26c5e
    HTML
    html.html_safe
  end

<<<<<<< HEAD
  def expense_error!
=======
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
>>>>>>> b96094dbbc906571a04744ef07e3a0a833e26c5e
    return if @transaction.errors.empty?
    messages = @transaction.errors.full_messages.map { |m| content_tag(:li, m) }.join
    html = <<-HTML
     <div class="alert alert-danger alert-dismissable">
      <ul>#{messages}</ul>
    </div>
    HTML
    html.html_safe
  end

<<<<<<< HEAD
  def income_error!
=======
  def income_errors!
>>>>>>> b96094dbbc906571a04744ef07e3a0a833e26c5e
    return if @transaction.errors.empty?
    messages = @transaction.errors.full_messages.map { |m| content_tag(:li, m) }.join
    html = <<-HTML
     <div class="alert alert-danger alert-dismissable">
      <ul>#{messages}</ul>
    </div>
    HTML
    html.html_safe
  end

<<<<<<< HEAD
  def collect_catagory
    @categories.collect { |c| [c.name, c.id] }
  end

  def collect_collection
    @collections.collect { |c| [[c.name, c.created_at.to_date].join(' '), c.id] }
  end

  def collect_unique
  	@collections.uniq.collect {|c| [[c.name, c.created_at.to_date.to_s].join(' '),c.id]}
  end

  def collect_only_course
  	@courses.collect {|c| [c.course_name, c.id] }
  end

  def collect_department
    @departments.map { |d| [d.name, d.id] }
  end

  def collect_salary_month
    @salary_months.map {|c| [c.salary_date.strftime("%B %Y"),c.salary_date.strftime("%Y-%m-%d")]}
  end
end
=======
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
>>>>>>> b96094dbbc906571a04744ef07e3a0a833e26c5e
