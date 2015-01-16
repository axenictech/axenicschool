# Newscast model
class Newscast < ActiveRecord::Base
  has_many :comments, counter_cache: true
  belongs_to :user
  validates :title, presence: true, length: { minimum: 1, maximum: 100 }
  validates :content, presence: true, length: { minimum: 1, maximum: 9000 }
  scope :shod, ->(id) { where(id: id).take }

  def self.news(title)
    return if title.empty?
    Newscast.where('title ilike ?', "#{title}%")
  end
end
