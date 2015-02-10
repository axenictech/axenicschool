class PrivilegeTag < ActiveRecord::Base
  has_many :privileges
end

class Privilege < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :privilege_tag
end

class PrivilegesUsers < ActiveRecord::Base
  belongs_to :privileges
  belongs_to :privileges_tag
  belongs_to :user
end
