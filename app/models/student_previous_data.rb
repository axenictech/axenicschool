class StudentPreviousData < ActiveRecord::Base
	belongs_to :student
	validates :institution, presence: true ,format: { with: /\A[a-z A-Z]+\z/,message: "only allows letters" }
	validates_length_of :institution,:minimum => 1,:maximum =>100

    validates :year ,numericality: { only_integer: true }
    validates_length_of :year,:minimum => 4,:maximum =>4

    validates :course, presence: true ,format: { with: /\A[a-zA-Z0-9._" "-\/]+\z/}
	validates_length_of :course,:minimum => 1,:maximum =>80

	validates :total_mark ,numericality: { only_integer: true }
    validates_length_of :total_mark,:minimum => 2,:maximum =>4
end
