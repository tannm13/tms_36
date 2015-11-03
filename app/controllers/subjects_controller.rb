class SubjectsController < ApplicationController
  before_action :find_subject, only: :show

  def show
    @tasks = @subject.tasks
  end

  private
  def find_subject
    @subject = Subject.find params[:id]
  end
end
