class MonthlyPayslip < ActiveRecord::Base
  belongs_to :employee

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
end
