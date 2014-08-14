class Batch < ActiveRecord::Base
  belongs_to :course
  has_many :grading_levels
  has_many :subjects
  has_many :elective_groups

end
