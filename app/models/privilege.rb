class Privilege < ActiveRecord::Base
  include Activity
  has_and_belongs_to_many :users
  belongs_to :privilege_tag
  scope :shod, ->(id) { where(id: id).take }
end
