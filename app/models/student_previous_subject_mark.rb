class StudentPreviousSubjectMark < ActiveRecord::Base
  include Activity
  belongs_to :student
  validates :subject, presence: true, format: { with: /\A[a-z A-Z]+\z/, message: 'only allows letters' }
  validates_length_of :subject, minimum: 1, maximum: 20

  validates :mark, numericality: { only_integer: true }
  validates_length_of :mark, minimum: 2, maximum: 3
  scope :shod, ->(id) { where(id: id).take }
  scope :m, ->(id) { where(student_id: id) }
end
