class QuestionType < ActiveRecord::Base
  has_many :weightages
  validates :que_type, presence: true, length: \
  { minimum: 1, maximum: 50 }, format: { with: /\A[a-z A-Z 0-9_.-\/]+\z/ }
end
