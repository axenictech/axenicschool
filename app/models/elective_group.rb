class ElectiveGroup < ActiveRecord::Base

	belongs_to :batch
  	has_many :subjects
  	validates :name, presence: true, length:{maximum: 20}, format:{ with: /\A[a-zA-Z0-9" "]+\Z/}
end
