class CourseSubject < ActiveRecord::Base
  include StateAble

  enum status: {started: 0, finished: 1}

  belongs_to :course
  belongs_to :subject

  has_many :course_subject_tasks
  has_many :tasks, through: :course_subject_tasks

  after_create :create_user_subjects

  private
  def create_user_subjects
    if self.course.started? && self.course.user_courses.present?
      self.course.user_courses.each do |user_course|
        user_course.user_subjects.create user_id: user_course.user.id,
          subject_id: self.subject.id, status: :started
      end
    end
  end
end
