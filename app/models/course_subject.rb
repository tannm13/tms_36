class CourseSubject < ActiveRecord::Base
  belongs_to :course
  belongs_to :subject
  
  has_many :course_subject_tasks
  has_many :tasks, through: :course_subject_tasks
end
