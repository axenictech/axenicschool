class Batch < ActiveRecord::Base

  belongs_to :course

  has_many :students,dependent: :destroy
  # has_many :archived_students, dependent: :destroy
  has_many :grading_levels, dependent: :destroy
  has_many :subjects, dependent: :destroy
  has_many :elective_groups, dependent: :destroy
  # has_many :exam_groups, dependent: :destroy
  # has_many :fee_category , :class_name => "FinanceFeeCategory"
  # has_many :additional_exam_groups, dependent: :destroy
  has_and_belongs_to_many :graduated_students, :class_name => 'Student', :join_table => 'batch_students', dependent: :destroy
  
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
