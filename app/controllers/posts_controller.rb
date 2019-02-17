class  PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :set_post, only: %i[show edit update destroy]
  before_action :prevent_hack, only: %i[edit update destroy]

  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      flash[:success] = "You have created an post"
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      flash[:success] = "You have successfully edit your post"
      redirect_to @post
    else
      flash[:danger] = "There was error with editing your post"
      render 'edit'
    end
  end


  def destroy
    @post.destroy

    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def prevent_hack
    if @post.user != current_user
      flash[:danger] = "You can not modify someone else posts!!!"
      redirect_to @post
    end
  end

  def post_params
   params.require(:post).permit(:text)
  end
end
