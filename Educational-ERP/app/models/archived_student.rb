class ArchivedStudent < ActiveRecord::Base
  belongs_to :country
  belongs_to :batch
  belongs_to :category
  belongs_to :nationality, :class_name => 'Country'
  has_one    :student_previous_data
  has_many   :student_previous_subject_marks
  has_many   :guardians
  # has_many   :finance_transactions, dependent: :destroy
  # has_many   :fee_category ,:class_name => "FinanceFeeCategory", dependent: :destroy
  
end
