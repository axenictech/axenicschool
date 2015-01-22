class Changedata < ActiveRecord::Migration
  def change
  	change_column :question_databases, :option,:string,array:true
  end
end
