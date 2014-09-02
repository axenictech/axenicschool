class Newscast < ActiveRecord::Base
	has_many :comments
	validates :title, presence: true,
								length: { minimum: 4, maximum: 100 }

	validates :content, presence: true,
								length: { minimum: 4, maximum: 500 }
end
