# Event model
class Event < ActiveRecord::Base
  has_many :batch_events
  scope :shod, ->(id) { where(id: id).take }

  def create_to_all
    if is_common?
      Batch.all.each do |batch|
        BatchEvent.create(batch_id: batch.id, event_id: event)
      end
      EmployeeDepartment.all.each do |dept|
        EmployeeDepartmentEvent.create(employee_department_id: dept.id, event_id: event)
      end
    else
      unless params[:batches].nil?
        params[:batches].each do |batch|
          BatchEvent.create(batch_id: batch, event_id: event)
        end
      end
      unless params[:departments].nil?
        params[:departments].each do |dept|
          EmployeeDepartmentEvent.create(employee_department_id: dept, event_id: event)
        end
      end
    end
  end
end
