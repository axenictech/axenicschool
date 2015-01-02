class MonthlyPayslip < ActiveRecord::Base
  belongs_to :employee
  scope :shod, ->(id) { where(id: id).take }
  def approve_salary
    update(is_approved: true)
    employee = self.employee
    category = FinanceTransactionCategory.find_by_name('Salary')
    t = category.finance_transactions.new
    t.title = "#{employee.first_name + ' ' + employee.last_name}"
    t.description = "Employee Salary Month:- #{salary_date.strftime('%B %Y')}"
    t.amount = amount
    t.transaction_date = Date.today
    t.save
  end

  def self.view(s, e)
    find_by_salary_date_and_employee_id(s, e)
  end

  def salary(date)
    where(salary_date: date).take
  end
end
