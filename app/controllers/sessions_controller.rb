class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = t "static_pages.home.welcome"
      redirect_back_or root_url
    else
      flash.now[:danger] = t "flashs.user.invalid"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
