class Comment < ActiveRecord::Base
  belongs_to :newscast
  validates :statement, presence: true
end
