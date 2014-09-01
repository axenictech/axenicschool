class StudentPreviousData < ActiveRecord::Base
	belongs_to :student
	validates :institution, presence: true ,format: { with: /\A[a-z A-Z]+\z/,message: "only allows letters" }
	validates_length_of :institution,:minimum => 5,:maximum =>50

    validates :year ,numericality: { only_integer: true }
    validates_length_of :year,:minimum => 4,:maximum =>4

    validates :course, presence: true ,format: { with: /\A[a-z A-Z 0-9]+\z/}
	validates_length_of :course,:minimum => 1,:maximum =>10

	validates :total_mark ,numericality: { only_integer: true }
    validates_length_of :total_mark,:minimum => 2,:maximum =>4
end
