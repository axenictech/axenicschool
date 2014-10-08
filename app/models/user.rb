class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable,
    :validatable, :timeoutable, :confirmable
  
  validates :username, presence:true, uniqueness: true, length: { :in => 1..50 },
  				format:{ with: /\A[a-zA-Z0-9]+\Z/}
  validates :first_name, presence:true, length: { :in => 1..25 },format:{ with: /\A[a-zA-Z" "]+\Z/}
  validates :last_name, presence:true, length: { :in => 1..25 },format:{ with: /\A[a-zA-Z" "]+\Z/}
  
end
