class Changebooleantostring < ActiveRecord::Migration
  def change
    change_column :question_databases, :is_answer, :string
  end
end
