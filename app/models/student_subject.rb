class StudentSubject < ActiveRecord::Base
  belongs_to :student
  belongs_to :subject
  scope :shod, ->(id) { where(id: id).take }
end
