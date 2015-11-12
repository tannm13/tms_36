class Supervisors::CourseSubjectsController < ApplicationController
  before_action :authorize_user
  before_action :authorize_supervisor
  before_action :find_course, only: [:index, :update]
  before_action :find_course_subject, only: [:edit, :update]

  def index
    @subjects = Subject.all
  end

  def update
    "finish_subject" == params[:activity]  ? finish_subject : add_subjects
  end

  private
  def add_subjects
    if @course.update_attributes course_params
      flash[:success] = t "courses.update_success"
      redirect_to [:supervisors, @course]
    else
      flash[:danger] = t "courses.update_error"
      render :edit
    end
  end

  def finish_subject
    if @course_subject.update_attributes status: :finished
      flash.now[:success] = t "flashs.subject.updated"
    else
      flash.now[:danger] = t "flashs.subject.error_updated"
    end
    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  def find_course
    @course = Course.find params[:course_id]
  end

  def find_course_subject
    @course_subject = CourseSubject.find params[:id]
  end

  def course_params
    params.require(:course).permit subject_ids: []
  end
end
