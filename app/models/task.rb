class Task < ActiveRecord::Base
  include StateAble

  enum status: {started: 0, finished: 1}

  belongs_to :subject

  has_many :user_tasks, dependent: :destroy
  has_many :users, through: :user_tasks

  after_create :create_user_tasks

  private
  def create_user_tasks
    self.subject.user_subjects.each do |user_subject|
      user_subject.user_tasks.create(user_id: user_subject.user.id,
        task_id: self.id, status: self.subject.status)
    end
  end
end
