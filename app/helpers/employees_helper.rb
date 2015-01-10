# employe helper
module EmployeesHelper
  def collect_department
    @empdept.collect { |b| [b.name, b.id] }
  end
end
