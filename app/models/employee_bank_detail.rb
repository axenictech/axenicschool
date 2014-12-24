class EmployeeBankDetail < ActiveRecord::Base
  belongs_to :employee
  belongs_to :bank_field

  def self.bankdetails(emp, details)
    details.each_pair do |k, v|
      EmployeeBankDetail.create(employee_id: emp.id,\
                                bank_field_id: k,\
                                bank_info: v['bank_info'])
    end
  end
end
