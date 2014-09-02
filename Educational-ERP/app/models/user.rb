class User < ActiveRecord::Base
	before_save  :hashed_password

attr_accessor :password

  validates :username, presence:true, uniqueness: true, length: { :in => 3..20 }
  validates :email, presence:true, uniqueness: true
	def hashed_password
		salt = BCrypt::Engine.generate_salt
	    encrypted_password= BCrypt::Engine.hash_secret(password, salt)
	    hashed_password=[salt,encrypted_password].join(":")
	end
end
