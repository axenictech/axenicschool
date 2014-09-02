class User < ActiveRecord::Base
	
attr_accessor :password

  validates :username, presence:true, uniqueness: true, length: { :in => 3..20 }
  validates :email, presence:true, uniqueness: true
  before_save  :hashed_password
  validates :password, presence: true,length: { :in => 6..20 }

	# def hashed_password
	# 	if password.present?
	# 		salt = BCrypt::Engine.generate_salt
	# 	    encrypted_password= BCrypt::Engine.hash_secret(password, salt)
	# 	    hashed_password=[salt,encrypted_password].join(":")
	# 	end
	# end

	def before_save
    self.salt = random_string(8) if self.salt == nil
    self.hashed_password = Digest::SHA1.hexdigest(self.salt + self.password) unless self.password.nil?
  end
end
