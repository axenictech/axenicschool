class Batch < ActiveRecord::Base

  validates :name, presence: true,length:{minimum:1, maximum:20}, format:{ with: /\A[a-zA-Z0-9._" "-]+\Z/}
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate  :end_date_cannot_be_less_than_start_date
  belongs_to :course
  
  has_many :students
  has_many :class_timings
  has_many :archived_students
  has_many :grading_levels
  has_many :elective_groups
  has_many :subjects
  has_many :weekdays
  has_many :batch_events
  has_many :exam_groups
  has_many :finance_fee_categories
  has_and_belongs_to_many :online_exams

  def end_date_cannot_be_less_than_start_date
    if end_date.present? and end_date < start_date
      errors.add(:end_date, "can't be less than start date")
    end
  end

   def has_own_weekday
     Weekday.where(batch_id:self.id).present?
   end
end
