class Guardian < ActiveRecord::Base
	belongs_to :country
  belongs_to :ward, :class_name => 'Student'
end
