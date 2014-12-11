class Newscast < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  validates :title, presence: true, length: { minimum: 1, maximum: 100 }
  validates :content, presence: true, length: { minimum: 1, maximum: 500 }
end
