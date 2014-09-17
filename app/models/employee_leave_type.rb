class EmployeeLeaveType < ActiveRecord::Base
	validates :name, presence: true,length:{minimum:1, maximum:20}, format:{ with: /\A[a-zA-Z_" "-]+\Z/}
    validates :code,presence:true,uniqueness:true,length: { :in => 1..20 },format: { with: /\A[a-zA-Z0-9_" "-\/]+\Z/}
    validates :max_leave_count, numericality: { only_integer: true },length:{minimum:1,maximum:10}

end
