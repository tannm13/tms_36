class CoursesController < ApplicationController
  before_action :find_course, only: :show

  def show
    @subjects = @course.subjects
  end

  private
  def find_course
    @course = Course.find params[:id]
  end
end
