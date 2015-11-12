class AddIndexToUserSubjects < ActiveRecord::Migration
  def change
    add_index :user_subjects, [:user_id, :subject_id], unique: true
  end
end
