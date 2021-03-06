# Attendence model
class Attendence < ActiveRecord::Base
  include Activity
  belongs_to :subject
  belongs_to :batch
  validates :reason, presence: true, length: \
  { minimum: 1, maximum: 30 }, format: { with: /\A[a-zA-Z0-9._" "-]+\Z/ }
  scope :shod, ->(id) { where(id: id).take }
end
