# ExamGroup
class ExamGroup < ActiveRecord::Base
  belongs_to :batch
  has_many :exams, dependent: :destroy
  accepts_nested_attributes_for :exams
  validates :name, presence: true, length: \
  { minimum: 1, maximum: 30 }, format: { with: /\A[a-zA-Z0-9._" "-\/]+\Z/ }
  validates :exam_type, presence: true
  scope :shod, ->(id) { where(id: id).take }
  scope :result_published, -> { where(result_published: true) }

  def update_exam(exam_group, p)
    return unless p.present?
    p.each do |s|
      exam = Exam.where(subject_id: s, exam_group_id: exam_group.id).take
      exam.destroy unless exam.nil?
    end
  end

  def exam_details(ex)
    exams_data = ex.exams.all
    flag = false
    exams_data.each do |exam|
      exam.exam_scores.each do |es|
        flag = true if es.is_failed?
      end
      exams << exam if flag == true
    end
    exams
  end

  def publish(ex)
    flag = false
    unless ex.exams.nil?
      ex.exams.each do |exam|
        next if exam.end_time.nil?
        flag = true if exam.end_time >= Date.today
      end
    end
    flag
  end

  def weightage
    return unless exams.first.nil?
    exams.first.weightage
  end 
end
