# bank details
class EmployeeBankDetail < ActiveRecord::Base
  include Activity
  belongs_to :employee
  belongs_to :bank_field
  def self.bankdetails(emp, details)
    details.each_pair do |k, v|
      EmployeeBankDetail.create(employee_id: emp.id,\
                                bank_field_id: k,\
                                bank_info: v['bank_info'])
    end
  end

  scope :shod, ->(id) { where(id: id).take }
  scope :bank_details, -> (emp) { where(employee_id: emp.id) }

  def self.up(emp, k)
    find_by_id_and_employee_id(k, emp.id)
  end
end
