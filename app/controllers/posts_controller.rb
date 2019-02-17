class  PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    @post.save

    redirect_to @post
  end


  def destroy
    @post = Post.find(params[:id])
    if current_user == @post.user
      @post.destroy
    else
      flash[:notice] = "Bad bad you are!"
    end

    redirect_to posts_path
  end

  private

  def post_params
   params.require(:post).permit(:text)
  end
end
