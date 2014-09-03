class CreateOnlineExamScores < ActiveRecord::Migration
  def change
    create_table :online_exam_scores do |t|
    t.references :student, index:true
      t.references :online_exam,index:true
      t.decimal    :marks
      t.references :grading_level, index:true
      t.string     :remarks
      t.boolean    :is_failed
      t.timestamps
  
      
    end
  end
end
