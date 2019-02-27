class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @favorite = @post.favorites.create(user: current_user)
  end

  def destroy
    @favorite = Favorite.find_by(user: current_user, post: @post)
    @favorite.destroy
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
