class Supervisors::CourseSubjectsController < ApplicationController
  before_action :authorize_user
  before_action :authorize_supervisor
  before_action :find_course, only: [:edit, :update]

  def edit
    @subjects = Subject.all
  end

  def update
    if @course.update_attributes course_params
      flash[:success] = t "courses.update_success"
      redirect_to [:supervisors, @course]
    else
      flash[:danger] = t "courses.update_error"
      render :edit
    end
  end

  private
  def find_course
    @course = Course.find params[:course_id]
  end

  def course_params
    params.require(:course).permit subject_ids: []
  end
end
