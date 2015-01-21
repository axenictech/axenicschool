# QusetionType
class QusetionType < ActiveRecord::Base
  belongs_to :placement_exam
  validates :que_type, presence: true, length: { minimum: 1, maximum: 20 },\
               format: { with: /\A[a-zA-Z0-9.\/_" "-]+\Z/ }
end
