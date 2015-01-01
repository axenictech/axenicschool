class IndividualPayslipCategory < ActiveRecord::Base
  belongs_to :employee
  scope :shod, ->(id) { where(id: id).take }

  def self.create_category(emp, p)
    new(employee_id: emp.id, name: p[:name], amount: p[:amount]\
    , is_deduction: p[:is_deduction])
  end

  def salary(date)
    where(salary_date: date).take
  end
end
