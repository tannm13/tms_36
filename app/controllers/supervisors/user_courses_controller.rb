class Supervisors::UserCoursesController < ApplicationController
  before_action :authorize_user
  before_action :authorize_supervisor
  before_action :find_user_course, except: [:index, :new, :create]
  before_action :find_course, only: :index

  def index
    @users = User.all.paginate page: params[:page]
    @users.each do |user|
      unless @course.user_courses.find_by(user_id: user.id)
        @course.user_courses.build user_id: user.id
      end
    end
  end

  def show
    @user = User.find params[:user_id]
    @user_subjects = @user.user_subjects
  end

  private
  def find_user_course
    @user_course = UserCourse.find params[:id]
  end

  def find_course
    @course = Course.find params[:course_id]
  end
end
