class CourseSubjectTask < ActiveRecord::Base
  belongs_to :course
  belongs_to :subject
  belongs_to :task
  belongs_to :course_subject
end
