class UserActivity < ActiveRecord::Base
  belongs_to :user
  scope :shod, ->(id) { where(id: id).take }

  def self.activity(name, id, action)
    activity = UserActivity.new
    activity.user_id = User.current.id
    activity.modelname = name
    activity.model_id = id
    activity.action = action
    activity.save
  end

  def activity_model
    (Object.const_get modelname).shod(model_id).attributes
  end
end
