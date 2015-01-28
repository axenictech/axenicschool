class PlacementExam < ActiveRecord::Base
  belongs_to :company
  has_many :weightages
  validates :company_id, presence: true
  validates :question_count, presence: true, numericality: { only_integer: true }

end
