# course model
class Course < ActiveRecord::Base
  validates :course_name, presence: true, length: \
  { minimum: 1, maximum: 60 }, format: { with: /\A[a-zA-Z0-9._" "-\/]+\Z/ }
  validates :section_name, presence: true, length: \
  { minimum: 1, maximum: 30 }, format: { with: /\A[a-zA-Z0-9_" "-]+\Z/ }
  validates :code, uniqueness: true, presence: true, length: \
  { minimum: 1, maximum: 20 }, format: { with: /\A[a-zA-Z0-9._" "-]+\Z/ }

  has_many :batches, dependent: :destroy
  has_many :batch_groups
  accepts_nested_attributes_for :batches
  has_many :class_designations
  has_many :ranking_levels
  scope :shod, ->(id) { where(id: id).take }

  def increase_order(rl, selected, previous, temp)
    rl.each do |p|
      if (selected == previous)
        temp = p
      end
      if (selected + 1.to_i == previous)
        current = p.prioriy
        previous_pri = temp.prioriy
        p.update(prioriy: nil)
        temp.update(prioriy: current)
        p.update(prioriy: previous_pri)
       end
      previous = previous + 1.to_i
    end
  end

  def decrease_order(rl, selected, next_pri, temp)
    rl.each do |p|
      if (selected - 1.to_i == next_pri)
        temp = p
      end
      if (selected == next_pri)
        current = p.prioriy
        next_priority = temp.prioriy
        p.update(prioriy: nil)
        temp.update(prioriy: current)
        p.update(prioriy: next_priority)
      end
      next_pri = next_pri + 1.to_i
    end
  end
end
