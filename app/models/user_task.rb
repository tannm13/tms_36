class UserTask < ActiveRecord::Base
  include StateAble
  include LogAble
  enum status: {started: 0, finished: 1}

  belongs_to :user
  belongs_to :task
  belongs_to :user_subject

  after_update :log_activity
end
