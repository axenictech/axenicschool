class CreateOnlineExamGroups < ActiveRecord::Migration
  def change
    create_table :online_exam_groups do |t|
    	t.string     :name
      t.references :batch, index:true
      t.string     :exam_type
      t.boolean    :is_published, :default=>false
      t.boolean    :result_published, :default=>false
      t.string     :students_list
      t.date       :exam_date
 
      t.timestamps
    end
  end
end
