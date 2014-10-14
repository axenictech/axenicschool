class ClassDesignation < ActiveRecord::Base
	belongs_to :course
	 validates :name, presence: true,length:{minimum:1, maximum:20}, format:{ with: /\A[a-zA-Z0-9" "-]+\Z/}
      validates :marks, presence: true ,numericality: { only_integer: true ,less_than:100}
end
