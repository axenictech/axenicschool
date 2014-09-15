class Exam < ActiveRecord::Base
	belongs_to :exam_group
	belongs_to :subject
	has_many :exam_scores
	accepts_nested_attributes_for :exam_scores 
end
