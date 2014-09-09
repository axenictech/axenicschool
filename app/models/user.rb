class User < ActiveRecord::Base

attr_accessor :password, :old_password, :new_password, :confirm_password

  validates :username, presence:true, uniqueness: true, length: { :in => 3..20 },
  				format:{ with: /\A[a-zA-Z0-9]+\Z/}
  validates :first_name, presence:true, length: { :in => 3..20 },format:{ with: /\A[a-zA-Z]+\Z/}
  validates :last_name, presence:true, length: { :in => 3..20 },format:{ with: /\A[a-zA-Z]+\Z/}
  validates :email, presence:true, uniqueness: true,
  				format:{with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/}
  validates :password, presence: true,length: { :in => 6..20 },on: :create
  
before_save :hash_password

	def hash_password
		if password.present?
			salt = BCrypt::Engine.generate_salt
		    encrypted_password= BCrypt::Engine.hash_secret(password, salt)
		    self.hashed_password=[salt,encrypted_password].join(":")
		end
	end

	def self.authenticate?(username,password)
		user = User.find_by_username username
		split_password=user.hashed_password.split(":")
		match_password=BCrypt::Engine.hash_secret(password, split_password[0])
   		split_password[1] == match_password
	end
end
