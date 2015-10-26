class Supervisors::SubjectsController < ApplicationController
  before_action :find_subject, except: [:new, :create, :index]
  before_action :authorize_user
  before_action :authorize_supervisor

  def new
    @subject = Subject.new
    @subject.tasks.build
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = t "flashs.subject.created"
      redirect_to [:supervisors, @subject]
    else
      flash.now[:danger] = t "flashs.subject.error_created"
      @subject.tasks.build
      render :new
    end
  end

  private
  def find_subject
    @subject = Subject.find params[:id]
  end

  def subject_params
    params.require(:subject).permit :name, :description, :status, :start_date,
    :end_date, tasks_attributes: [:id, :name, :description, :_destroy]
  end
end
