class Supervisors::DashboardController < ApplicationController
  before_action :authorize_user
  before_action :authorize_supervisor
  def index
    @number_of_users = User.all.size
    @number_of_courses = Course.all.size
    @number_of_subjects = Subject.all.size
  end
end
