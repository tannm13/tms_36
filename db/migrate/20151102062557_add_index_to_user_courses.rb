class AddIndexToUserCourses < ActiveRecord::Migration
  def change
    add_index :user_courses, [:user_id, :course_id], unique: true
  end
end
