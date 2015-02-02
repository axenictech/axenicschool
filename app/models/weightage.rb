class Weightage < ActiveRecord::Base
  belongs_to :placement_exam
  belongs_to :question_type
end
