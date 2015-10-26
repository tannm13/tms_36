class Supervisors::CoursesController < ApplicationController
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

  private
  def init_course
    @course = Course.find params[:id]
  end

  def course_params
    params.require(:course).permit :name, :description, :status, :start_date,
    :end_date, subject_ids: []
  end
end
