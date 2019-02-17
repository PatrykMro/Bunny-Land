class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def index
  end

  def dashboard
    @posts = current_user.posts
  end

end
