class RemoveIndexFromUserSubjects < ActiveRecord::Migration
  def change
    remove_index :user_subjects, [:user_id, :subject_id]
  end
end
