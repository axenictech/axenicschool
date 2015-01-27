class Option < ActiveRecord::Base
  belongs_to :question
  belongs_to :question_database
  validates :option, presence: true
  validates :is_answer, presence: true
end
