class CoursesController < ApplicationController
  before_action :find_course, only: :show
  before_action :find_user_course, only: :show

  def show
    @user_subjects = @user_course.user_subjects
    @activities =
      Activity.by_target(@course).recent.paginate page: params[:page]
  end

  private
  def find_user_course
    @user_course = UserCourse.find_by user_id: params[:user_id],
      course_id: params[:id]
  end

  def find_course
    @course = Course.find params[:id]
  end
end
