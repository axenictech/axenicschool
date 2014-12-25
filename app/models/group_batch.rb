class GroupBatch < ActiveRecord::Base
  belongs_to :batch_group
  scope :shod, ->(id) { where(id: id).take }
end
