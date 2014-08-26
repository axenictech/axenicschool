class Newscast < ActiveRecord::Base
	has_many :comments
	validates :title, presence: true,
								length: { minimum: 4, maximum: 20 }

	validates :content, presence: true,
								length: { minimum: 4, maximum: 160 }
end
