class EmployeePosition < ActiveRecord::Base
  belongs_to :employee_category
  validates :name, presence: true,
                   length: { minimum: 1, maximum: 30 }, format: { with: /\A[a-z A-Z 0-9_.-\/]+\z/, message: 'Name allows Alphanumeric with _, ., -, /' }

  validates :employee_category, presence: true
  scope :is_status, -> { includes(:employee_category).where(status: true).order(:name) }
  scope :not_status, -> { includes(:employee_category).where(status: false).order(:name) }
end
