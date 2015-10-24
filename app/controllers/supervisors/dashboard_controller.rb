class Supervisors::DashboardController < ApplicationController
  before_action :authorize_user
  before_action :authorize_supervisor
  def index
    @number_of_users = User.size
    @number_of_courses = Course.size
  end
end
