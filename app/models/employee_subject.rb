class EmployeeSubject < ActiveRecord::Base
  belongs_to :employee
  belongs_to :subject
  has_one :batch,through: :subject
  def self.allot_work(employee_subj_ids)
    status,error_carrier = false,self.new
    self.transaction d  o
    emp_subjs = [  ]
    employee_subj_ids.each do |subj_id,emp_id  |
      subject_asso = self.find_or_create_by(subject_id: subj_id  )
      subject_asso.employee_id = emp_i  d
      subject_asso.sav  e
      emp_subjs << subject_ass  o
    en  d
  end
end
end