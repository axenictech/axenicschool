class Guardian < ActiveRecord::Base
	belongs_to :country
    belongs_to :student
end
