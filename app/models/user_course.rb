class UserCourse < ActiveRecord::Base
  include StateAble
  include LogAble
  enum status: {started: 0, finished: 1}

  belongs_to :user
  belongs_to :course

  after_create :log_create
  after_destroy :log_destroy
  after_update :log_activity

  private
  def log_create
    log_activity "create"
  end

  def log_destroy
    log_activity "destroy"
  end
end
