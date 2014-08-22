class Newscast < ActiveRecord::Base
	has_many :comments
end
