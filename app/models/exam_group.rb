class ExamGroup < ActiveRecord::Base
  belongs_to :batch
  has_many :exams, dependent: :destroy
  accepts_nested_attributes_for :exams
  validates :name, presence: true, length: \
  { minimum: 1, maximum: 30 }, format: { with: /\A[a-zA-Z0-9._" "-\/]+\Z/ }
  validates :exam_type, presence: true
  scope :shod, ->(id) { where(id: id).take }
  scope :result_published, -> { where(result_published: true) }
end
