# PrivilegeUsers
class PrivilegeUsers < ActiveRecord::Base
  include Activity
  belongs_to :privileges
  belongs_to :privileges_tag
  belongs_to :user
  scope :shod, ->(id) { where(id: id).take }

  def self.privilege_update(privilege_tag, user)
    if privilege_tag.present?
      privilege_tag.each  do |p_t|
        privileges = PrivilegeTag.find(p_t).privileges.all

        next if  privileges.nil?
        privileges.each do |p|
          PrivilegeUsers.create(user_id: user.id, privilege_id: p.id)
        end
      end
    end
  end
end
