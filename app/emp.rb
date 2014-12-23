module emp

  def emp1
 before_filter :grade, only: \
  [:edit_grade, :update_grade, :destroy_grade]
  before_filter :category, only:
  [:edit_category, :update_category, :destroy_category]
  before_filter :department, only: \
  [:edit_department, :update_department, :destroy_department]
  before_filter :position, only: \
  [:edit_position, :update_position, :destroy_position]
  before_filter :bank_field, only: \
  [:edit_bank_field, :update_bank_field, :destroy_bank_field]
  before_filter :payroll_category, :only \
  [:edit_payroll_category, :update_payroll_category, \
   :destroy_payroll_category, :active_payroll_category, \
   :inactive_payroll_category]
 end
 end