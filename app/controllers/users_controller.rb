class UsersController < ApplicationController
  before_action :authorize_user
  before_action :correct_user, only: [:edit, :update]
  before_action :find_user, except: :index

  def index
    @users = User.not_supervisors.paginate page: params[:page]
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "flashs.user.edit"
      redirect_to @user
    else
      flash.now[:danger] = t "flashs.user.error_edit"
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def find_user
    @user = User.find params[:id]
  end
end
