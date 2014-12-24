class Weekday < ActiveRecord::Base
  belongs_to :batch
  scope :shod, ->(id) { where(id: id).take }
end
