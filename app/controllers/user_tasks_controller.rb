class UserTasksController < ApplicationController
  before_action :find_user_task, only: :update

  def update
    if @user_task.update_status :finished
      flash.now[:success] = t "flashs.course.update"
    else
      flash.now[:danger] = t "flashs.user.invalid"
    end
    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  private
  def find_user_task
    @user_task = UserTask.find params[:id]
  end
end
