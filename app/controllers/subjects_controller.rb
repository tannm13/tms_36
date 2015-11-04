class SubjectsController < ApplicationController
  before_action :find_subject, only: :show

  def show
    @user_tasks = current_user.user_tasks
  end

  private
  def find_subject
    @subject = Subject.find params[:id]
  end
end
