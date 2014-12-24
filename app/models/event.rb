class Event < ActiveRecord::Base
  has_many :batch_events
  scope :shod, ->(id) { where(id: id).take }
end
