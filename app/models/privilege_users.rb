class PrivilegeUsers < ActiveRecord::Base
  belongs_to :privileges
  belongs_to :privileges_tag
  belongs_to :user
  scope :shod, ->(id) { where(id: id).take }
end
