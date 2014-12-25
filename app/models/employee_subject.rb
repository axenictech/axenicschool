class EmployeeSubject < ActiveRecord::Base
  belongs_to :employee
  belongs_to :subject
  has_one :batch, through: :subject
  scope :shod, ->(id) { where(id: id).take }
  def self.assign_emp(sub)
    where(subject_id: sub.id)
  end
end
