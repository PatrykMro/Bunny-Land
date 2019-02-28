class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def new
    @comment = @post.comments.build(user: current_user)
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, success: 'Comment was successfully created.' }
        format.js   { }
      else
        format.html { render :new }
        format.js { render :new }
      end
    end
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def update
    @comment = @post.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @post, success: 'Comment was successfully updated.' }
        format.js   { }
      else
        format.html { render :edit }
        format.js { render :edit }
      end
    end
  end


  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
        format.html { redirect_to posts_path, success: 'Comment was successfully deleted.' }
        format.js   { }
      end
    end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
   params.require(:comment).permit(:body)
  end
end
