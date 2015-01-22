class Option < ActiveRecord::Base
  belongs_to :question
  belongs_to :question_database
end
