class CreateBatchOnlineExams < ActiveRecord::Migration
  def change
    create_table :batch_online_exams do |t|
      t.references :online_exam, index: true
      t.references :batch, index: true

      t.timestamps
    end
  end
end
