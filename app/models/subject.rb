class Subject < ActiveRecord::Base
  include StateAble

  enum status: {started: 0, finished: 1}

  has_many :tasks, dependent: :destroy
  has_many :course_subjects, dependent: :destroy
  has_many :courses, through: :course_subjects
  has_many :user_subjects, dependent: :destroy, inverse_of: :subject

  scope :recent, ->{order created_at: :desc}

  validates :name, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 1000}
  validates :status, presence: true

  accepts_nested_attributes_for :tasks, reject_if: :all_blank,
    allow_destroy: true
end
