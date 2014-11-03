class PrivilegesUsers < ActiveRecord::Base
	belongs_to :privileges
	belongs_to :privileges_tag
	belongs_to :user
end
