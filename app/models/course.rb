class Course < ActiveRecord::Base
  include StateAble

  enum status: {started: 0, finished: 1}

  has_many :user_courses
  has_many :users, through: :user_courses
  has_many :course_subjects
  has_many :subjects, through: :course_subjects

  validates :name, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 1000}
  validates :status, presence: true

  before_save :update_subjects_status

  private
  def update_subjects_status
    unless self.course_subjects.nil?
      self.course_subjects.each do |course_subject|
        self.finished? ? course_subject.update_status(:finished) :
        course_subject.update_status(:started)
      end
    end
  end
end
