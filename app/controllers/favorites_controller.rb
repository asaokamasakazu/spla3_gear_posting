class FavoritesController < ApplicationController
  before_action :authenticate_user

  def create
    @post = Post.find(params[:post_id])
    @post_favorites = @post.favorites.includes(user: { image_attachment: :blob }).
      order(created_at: :desc)
    Favorite.create(user_id: current_user.id, post_id: params[:post_id])
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post_favorites = @post.favorites.includes(user: { image_attachment: :blob }).
      order(created_at: :desc)
    favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id])
    favorite.destroy
  end
end
