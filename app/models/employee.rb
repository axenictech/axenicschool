class Employee < ActiveRecord::Base
  belongs_to  :employee_category
  belongs_to  :employee_position
  belongs_to  :employee_grade
  belongs_to  :employee_department
  belongs_to  :nationality, :class_name => 'Country'
  belongs_to  :user
  belongs_to  :reporting_manager,:class_name => "Employee"
  
  has_many    :employees_subjects
  has_many    :subjects ,:through => :employees_subjects
  has_many    :timetable_entries
  has_many    :employee_bank_details
  has_many    :employee_additional_details
  has_many    :apply_leaves
  has_many    :monthly_payslips
  has_many    :employee_salary_structures
  has_many    :finance_transactions, :as => :payee
  has_many    :employee_attendances
end
