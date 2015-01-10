# EmployeeAttendances Helper
module EmployeeAttendancesHelper
  def active_leave_not_found!
    return unless @active_leaves.empty?
    html = <<-HTML
     <div>
      <h4 align="center">No record found</h4>
    </div>
    HTML
    html.html_safe
  end

  def inactive_leave_not_found!
    return unless @inactive_leaves.empty?
    html = <<-HTML
     <div>
      <h4 align="center">No record found</h4>
    </div>
    HTML
    html.html_safe
  end
end
