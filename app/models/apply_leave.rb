class ApplyLeave < ActiveRecord::Base
  scope :shod, ->(id) { where(id: id).take }
end
