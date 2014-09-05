class User < ActiveRecord::Base

attr_accessor :password

  validates :username, presence:true, uniqueness: true, length: { :in => 3..20 }
  validates :email, presence:true, uniqueness: true
  validates :password, presence: true,length: { :in => 6..20 },on: :create

before_save :hash_password

	def hash_password
		if password.present?
			salt = BCrypt::Engine.generate_salt
		    encrypted_password= BCrypt::Engine.hash_secret(password, salt)
		    self.hashed_password=[salt,encrypted_password].join(":")
		end
	end
end
