class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_and_belongs_to_many :privileges
  belongs_to :general_setting
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable,
         :validatable, :timeoutable

  validates :username, presence: true, uniqueness: true, length: { in: 1..50 },
                       format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates :first_name, presence: true, length: { in: 1..25 }, format: { with: /\A[a-zA-Z" "]+\Z/ }
  validates :last_name, presence: true, length: { in: 1..25 }, format: { with: /\A[a-zA-Z" "]+\Z/ }
  scope :shod, ->(id) { where(id: id).take }
  def full_name
    first_name + ' ' + last_name
  end

  def create_general_setting
    gs = GeneralSetting.create(school_or_college_name: 'Axenic School')
    update(general_setting_id: gs.id, role: 'Admin')
  end

  def institute_name
    general_setting.school_or_college_name
  end

  def self.current
    Thread.current[:user]
  end
  def self.current=(user)
    Thread.current[:user] = user
  end
end
