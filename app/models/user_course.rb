class UserCourse < ActiveRecord::Base
  include StateAble
  include LogAble
  enum status: {started: 0, finished: 1}

  belongs_to :user
  belongs_to :course
  has_many :user_subjects

  after_create :log_create, :create_user_subjects
  after_destroy :log_destroy
  after_update :log_activity

  private
  def create_user_subjects
    if self.course.started? && self.course.subjects.present?
      self.course.subjects.each do |subject|
        self.user_subjects.create(user_id: self.user.id, subject_id: subject.id,
          status: :started)
      end
    end
  end

  def log_create
    log_activity "create"
  end

  def log_destroy
    log_activity "destroy"
  end
end
