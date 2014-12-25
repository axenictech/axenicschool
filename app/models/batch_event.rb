class BatchEvent < ActiveRecord::Base
  belongs_to :batch
  belongs_to :event
  scope :shod, ->(id) { where(id: id).take }
end
