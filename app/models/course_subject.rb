class CourseSubject < ActiveRecord::Base
  include StateAble

  enum status: {started: 0, finished: 1}

  belongs_to :course
  belongs_to :subject

  has_many :course_subject_tasks
  has_many :tasks, through: :course_subject_tasks
end
