class Supervisors::DashboardController < ApplicationController
  before_action :authorize_user
  before_action :authorize_supervisor
  def index
    @number_of_users = User.count
  end
end
