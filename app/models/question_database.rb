class QuestionDatabase < ActiveRecord::Base
  belongs_to :question_type
end
