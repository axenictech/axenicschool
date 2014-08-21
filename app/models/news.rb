class News < ActiveRecord::Base

	has_many :news_comments, dependent: :destroy
end
