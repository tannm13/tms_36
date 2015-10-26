class Subject < ActiveRecord::Base
  enum status: {started: 0, finished: 1}
  
  has_many :tasks, dependent: :destroy
  has_many :course_subjects, dependent: :destroy
  has_many :courses, through: :course_subjects

  validates :name, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 1000}
  validates :status, presence: true

  accepts_nested_attributes_for :tasks, reject_if: :all_blank, 
    allow_destroy: true
end
