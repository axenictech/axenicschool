class Electivegroup < ActiveRecord::Base
#validates method for validation
	validates :name, presence: true, length:{maximum: 20}, format:{ with: /\A[a-zA-Z0-9" "]+\Z/}
end
