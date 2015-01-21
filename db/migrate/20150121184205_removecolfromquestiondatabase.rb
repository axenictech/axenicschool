class Removecolfromquestiondatabase < ActiveRecord::Migration
  def change
    remove_column :question_databases, :no_of_option
    remove_column :question_databases, :option 
    remove_column :question_databases, :is_answer
  end
end
