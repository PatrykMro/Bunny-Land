class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def index
    @posts = Post.all
  end

  def dashboard
    @posts = current_user.posts.order("created_at DESC").paginate( page: params[:page], per_page: 10 )
  end

end
