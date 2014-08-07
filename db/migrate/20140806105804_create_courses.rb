class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_name
      t.string :code
      t.string :section_name
      t.boolean :is_deleted
      t.string :grading_type

      t.timestamps
    end
  end
end
