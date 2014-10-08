class Guardian < ActiveRecord::Base
	belongs_to :country
  belongs_to :student

    validates :first_name, presence: true ,format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }
	validates_length_of :first_name,:minimum => 1,:maximum =>20
    
    validates :last_name, presence: true, format: { with: /\A[a-z A-Z]+\z/,message: "only allows letters" }
    validates_length_of :last_name,:minimum => 1,:maximum =>20
  
    validates :relation, presence: true, format: { with: /\A[a-z A-Z]+\z/,message: "only allows letters" }
    validates_length_of :relation,:minimum => 1,:maximum =>20
	validates :country_id, presence: true
   validates :office_phone1 ,numericality: { only_integer: true },length:{minimum:6,maximum:6},allow_blank: true
   validates :office_phone2 ,numericality: { only_integer: true },length:{minimum:6,maximum:6},allow_blank: true
   validates :office_address_line1,length:{:in=> 1..20},allow_blank: true
   validates :office_address_line2,length:{:in=> 1..20},allow_blank: true
   validates :city, format: { with: /\A[a-z A-Z]+\z/,message: "only allows letters" },length:{:in=> 1..20},allow_blank: true
   validates :occupation, format: { with: /\A[a-z A-Z]+\z/,message: "only allows letters" },length:{:in=> 1..20},allow_blank: true     
   validates :income, numericality: { only_integer: true },length:{:in=> 1..10},allow_blank: true
   validates :education, format: { with: /\A[a-z A-Z]+\z/,message: "only allows letters" },
   length:{:in=> 1..20},allow_blank: true
   validates :email,format:{with: /\A[a-zA-Z0-9._-]+@([a-zA-Z0-9]+\.)+[a-zA-Z]{2,4}+\z/},allow_blank: true
  
   def create_user_account
    user = User.new do |u|
      u.first_name, u.last_name, u.username, u.student_id = self.first_name, self.last_name,  "#{self.first_name+self.last_name+self.student.admission_no.to_s}", self.student.id
      u.password = "#{self.student.admission_no.to_s}123456"
      u.role = 'Parent'
      u.email = ( self.email == '' or User.find_by_email(email) ) ? "#{self.first_name+self.last_name+self.student.admission_no.to_s}@axenic.com" : email
    end
    user.save
  end
end
