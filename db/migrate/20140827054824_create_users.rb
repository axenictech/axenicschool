class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string   :username
      t.string   :first_name
      t.string   :last_name
      t.string   :email
      t.string   :role
      t.string   :hashed_password
      t.string   :reset_password_code
      t.datetime :reset_password_code_until
      
      t.timestamps
    end
    create_default
  end

  def create_default
    User.create :username   => 'admin',:password   => 'admin123',:first_name => 'Fedena',
    :last_name  => 'Administrator',:email=> 'admin@fedena.com',:role=> 'Admin'
  end

end
