# employe helper
module EmployeesHelper
  def select_position
    @employees.collect { |e| [e.name, e.id] }
  end

  def collect_department
    @empdept.collect { |b| [b.name, b.id] }
  end
end
