class TimeTableEntry < ActiveRecord::Base
<<<<<<< HEAD
  belongs_to :course
=======
>>>>>>> 4eae252e3ffbc9dcfdb1377de942e9803d109e47
  belongs_to :batch
  belongs_to :class_timing
  belongs_to :subject
  belongs_to :employee
  belongs_to :weekday
end
