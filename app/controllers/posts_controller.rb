class  PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_post, only: %i[show edit update destroy]
  before_action :prevent_hack, only: %i[edit update destroy]

  def index
    @posts = Post.all.order("created_at DESC").paginate( page: params[:page], per_page: 10 )
    @post = Post.new
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, success: 'Post was successfully created.' }
        format.js   { }
      else
        format.html { render :new }
        format.js { render :new }
      end
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      flash[:success] = "You have successfully edit your post"
      redirect_to @post
    else
      render 'edit'
    end
  end


  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_path, success: 'Post was successfully created.' }
      format.js 

    end
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
