class Batch < ActiveRecord::Base

  validates :name, presence: true,length:{minimum:1, maximum:20}, format:{ with: /\A[a-zA-Z0-9_" "-]+\Z/}
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate  :end_date_cannot_be_less_than_start_date
  belongs_to :course
  
  has_many :students
  has_many :class_timings, dependent: :destroy
  has_many :archived_students, dependent: :destroy
  has_many :grading_levels, dependent: :destroy
  has_many :subjects, dependent: :destroy
  has_many :elective_groups, dependent: :destroy
  has_many :weekdays
  has_many :time_table_entries
  has_many :exam_groups, dependent: :destroy
  # has_many :fee_category , :class_name => "FinanceFeeCategory"
  # has_many :additional_exam_groups, dependent: :destroy
  # has_and_belongs_to_many :graduated_students, :class_name => 'Student', :join_table => 'batch_students'
  

  def end_date_cannot_be_less_than_start_date
    if end_date.present? and end_date < start_date
      errors.add(:end_date, "can't be less than start date")
    end
  end
  
end
