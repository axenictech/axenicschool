class Weight < ActiveRecord::Base
  belongs_to :PlacementExam
  belongs_to :QuestionType
end
