class CreateCourseSubjectTasks < ActiveRecord::Migration
  def change
    create_table :course_subject_tasks do |t|
      t.references :course, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true
      t.references :task, index: true, foreign_key: true
      t.references :course_subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
