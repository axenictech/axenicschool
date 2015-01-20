class PlacementExam < ActiveRecord::Base
  belongs_to :question_type
  belongs_to :company
end
