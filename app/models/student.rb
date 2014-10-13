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
  validates_length_of :first_name,:minimum => 1,:maximum =>20

  validates :last_name, presence: true, format: { with: /\A[a-z A-Z]+\z/,message: "only allows letters" }
  validates_length_of :last_name,:minimum => 1,:maximum =>20
  
  validates :date_of_birth, presence: true
  validates :batch_id, presence: true

  validates :category_id, presence: true
  validates :nationality_id, presence: true
  validates :country_id, presence: true
  validates :middle_name,format: { with: /\A[a-z A-Z]+\z/,message: "only allows letters" },
            length:{:in=> 1..20},allow_blank: true
  validates :birth_place, format: { with: /\A[a-z A-Z]+\z/,message: "only allows letters" },
              length:{:in=> 1..20},allow_blank: true 
  validates :language, format: { with: /\A[a-z A-Z]+\z/,message: "only allows letters" },
               length:{:in=> 1..30},allow_blank: true  
  validates :religion, format: { with: /\A[a-z A-Z]+\z/,message: "only allows letters" },
               length:{:in=> 1..20},allow_blank: true
  validates :address_line1,length:{:in=> 1..30},allow_blank: true
  validates :address_line2, length:{:in=> 1..20},allow_blank: true
  validates :city, format: { with: /\A[a-z A-Z]+\z/,message: "only allows letters" },
              length:{:in=> 1..30},allow_blank: true
  validates :state, format: { with: /\A[a-z A-Z]+\z/,message: "only allows letters" },
                length:{:in=> 1..30},allow_blank: true
  validates :pin_code, numericality: { only_integer: true },
                 length:{minimum:6,maximum:6},allow_blank: true
  validates :phone2 ,numericality: { only_integer: true },
              length:{minimum:10,maximum:10},allow_blank: true
  validates :email,format:{with: /\A[a-zA-Z0-9._-]+@([a-zA-Z0-9]+\.)+[a-zA-Z]{2,4}+\z/},allow_blank: true
  after_save :create_user_account

  def archived_student
    student_attributes = self.attributes   
    student_attributes["student_id"]= self.id
    archived_student = ArchivedStudent.new(student_attributes)
  end

  private
  def create_user_account
    user = User.new do |u|
      u.first_name, u.last_name, u.username, u.student_id = first_name, last_name, admission_no, id
      u.password = "#{admission_no.to_s}123456"
      u.role = 'Student'
      u.email = ( email == '' or User.find_by_email(email) ) ? "#{first_name+last_name+admission_no.to_s}@axenic.com" : email
    end
    user.save
  end

end
