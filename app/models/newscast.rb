class Newscast < ActiveRecord::Base
	has_many :comments
	validates :title, presence: true,length: { minimum: 1, maximum: 100 }
	validates :content, presence: true,length: { minimum: 1, maximum: 500 }
end
