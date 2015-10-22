class UsersController < ApplicationController
  before_action :authorize_user, except: [:destroy, :create, :new]

  def index
    @users = User.paginate page: params[:page]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "flashs.user.signup"
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :is_supervisor
  end
end
