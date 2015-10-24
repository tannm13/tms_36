class Course < ActiveRecord::Base
  enum status: {started: 0, finished: 1}
  has_many :user_courses
  has_many :users, through: :user_courses
  has_many :course_subjects
  has_many :subjects, through: :course_subjects

  validates :name, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 1000}
  validates :status, presence: true
end
