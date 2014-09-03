class Student < ActiveRecord::Base

  belongs_to :country
  belongs_to :batch
  belongs_to :category
  belongs_to :nationality, :class_name => 'Country'
  has_one    :student_previous_data
  has_many   :student_previous_subject_marks
  has_many   :guardians
  # has_many   :finance_transactions, dependent: :destroy
  # has_many   :fee_category ,:class_name => "FinanceFeeCategory", dependent: :destroy

 validates :admission_no, presence: true
  validates :admission_date, presence: true

  validates :first_name, presence: true, format: { with: /\A[a-z A-Z]+\z/,message: "only allows letters" }
  validates_length_of :first_name,:minimum => 2,:maximum =>15

  validates :last_name, presence: true, format: { with: /\A[a-z A-Z]+\z/,message: "only allows letters" }
  validates_length_of :last_name,:minimum => 1,:maximum =>15
  
  validates :date_of_birth, presence: true
  validates :batch_id, presence: true
  
end
