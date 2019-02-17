class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def index
    @posts = Post.all
  end

  def dashboard
    @posts = current_user.posts
  end

end
