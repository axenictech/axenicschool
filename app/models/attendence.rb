class Attendence < ActiveRecord::Base
		belongs_to :subject
		has_and_belongs_to_many :students, dependent: :destroy
end
