class Task < ActiveRecord::Base
  include StateAble

  enum status: {started: 0, finished: 1}

  belongs_to :subject

  has_many :user_tasks, dependent: :destroy
  has_many :users, through: :user_tasks
end
