class Subject < ActiveRecord::Base

	belongs_to :batch
	belongs_to :elective_group
end
