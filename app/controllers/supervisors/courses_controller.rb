class Supervisors::CoursesController < ApplicationController
  before_action :authorize_user
  before_action :authorize_supervisor
  before_action :find_course, except: [:index, :new]
  before_action :find_subject, except: [:destroy, :index, :show]

  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params
    if @course.save course_params
      flash[:success] = t "flashs.course.create"
      redirect_to :back
    else
      flash.now[:danger] = t "flashs.user.invalid"
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

  def edit
  end

  def update
    params[:finish_course] ? finish_course : update_course
  end

  private
  def update_course
    if @course.update_attributes course_params
      flash[:success] = t "flashs.course.update"
      redirect_to [:supervisors, @course]
    else
      flash.now[:danger] = t "flashs.user.invalid"
      render :back
    end
  end

  def finish_course
    if @course.update_status :finished
      flash.now[:success] = t "flashs.course.update"
    else
      flash.now[:danger] = t "flashs.user.invalid"
    end
    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  def find_course
    @course = Course.find params[:id]
  end

  def course_params
    params.require(:course).permit(:name, :description, :status, :start_date,
      :end_date, subject_ids: [], user_ids: [])
  end

  def find_subject
    @subjects = Subject.all
  end
end
