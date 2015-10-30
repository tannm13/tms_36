class Supervisors::CoursesController < ApplicationController
  before_action :authorize_user
  before_action :authorize_supervisor
  before_action :find_course, only: [:show, :destroy]

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

  def show
  end

  def destroy
    if @course.destroy
      flash[:success] = t "flashs.course.delete"
    else
      flash[:danger] = t "flashs.user.invalid"
    end
    redirect_to supervisors_courses_path
  end

  def index
    @courses = Course.paginate page: params[:page],
     per_page: Settings.courses.per_page
  end

  private
  def find_course
    @course = Course.find params[:id]
  end

  def course_params
    params.require(:course).permit :name, :description, :status, :start_date,
    :end_date, subject_ids: []
  end

  def find_course
    @course = Course.find params[:id]
  end
end
