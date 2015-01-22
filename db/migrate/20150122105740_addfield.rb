class Addfield < ActiveRecord::Migration
  def change
  	add_column :question_databases, :no_of_option,:integer
  end
end
