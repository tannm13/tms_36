class RemoveIndexFromUserCourse < ActiveRecord::Migration
  def change
    remove_index :user_courses, [:user_id, :course_id]
  end
end
