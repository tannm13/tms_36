class Supervisors::CoursesController < ApplicationController
  before_action :authorize_user
  before_action :authorize_supervisor
  def new
    @subjects = Subject.all
    @course = Course.new
  end

  def create
    @course = Course.new course_params
    if @course.save course_params
      flash[:success] = t "flashs.course.create"
      redirect_to :back
    else
      flash.now[:danger] = t "flashs.user.invalid"
      @subjects = Subject.all
      render :new
    end
  end

  def index
    @courses = Course.paginate page: params[:page],
     per_page: Settings.courses.per_page
  end
  private
  def course_params
    params.require(:course).permit :name, :description, :status, :start_date,
    :end_date, subject_ids: []
  end
end
