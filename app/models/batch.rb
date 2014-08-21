class Batch < ActiveRecord::Base
  belongs_to :course
  has_many :grading_levels, dependent: :destroy
  has_many :subjects, dependent: :destroy
  has_many :elective_groups, dependent: :destroy
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
