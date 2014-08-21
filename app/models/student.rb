class Student < ActiveRecord::Base

  belongs_to :country
  belongs_to :batch
  belongs_to :student_category
  belongs_to :nationality, :class_name => 'Country'
  has_one    :immediate_contact,dependent: :destroy
  has_one    :student_previous_data,dependent: :destroy
  has_many   :student_previous_subject_mark,dependent: :destroy
  has_many   :guardians, :foreign_key => 'ward_id', :dependent => :destroy
  has_many   :finance_transactions,dependent: :destroy
  has_many   :fee_category ,:class_name => "FinanceFeeCategory",dependent: :destroy

  has_and_belongs_to_many :graduated_batches, :class_name => 'Batch', :join_table => 'batch_students',dependent: :destroy

end
