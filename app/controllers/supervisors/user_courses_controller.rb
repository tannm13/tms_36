class Supervisors::UserCoursesController < ApplicationController
  before_action :authorize_user
  before_action :authorize_supervisor
  before_action :find_course, except: [:new, :create]

  def index
    @users = User.all.paginate page: params[:page]
  end

  private
  def find_course
    @course = Course.find params[:course_id]
  end
end
