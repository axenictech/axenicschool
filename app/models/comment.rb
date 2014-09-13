class Comment < ActiveRecord::Base
  belongs_to :newscast
  validates :statement,presence: true,length: { minimum: 1, maximum: 100 }

end
