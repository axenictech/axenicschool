# BatchTransfer Helper
module BatchTransfersHelper
  def collect_course
    return if @courses.empty?
    Course.all.collect { |p| [p.course_name, p.id] }
  end

  def collect_batch
    return if @batchs.empty?
    @batchs.collect { |b| [b.full_name, b.id] }
  end
end
