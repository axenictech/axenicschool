class PlacementExam < ActiveRecord::Base
  belongs_to :company
  has_many :weightages
end
