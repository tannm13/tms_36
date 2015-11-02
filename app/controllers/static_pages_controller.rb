class StaticPagesController < ApplicationController

  def home
    @courses = current_user.courses if current_user
  end
end
