class PrivilegeTag < ActiveRecord::Base
  has_many :privileges
  scope :shod, ->(id) { where(id: id).take }
end
