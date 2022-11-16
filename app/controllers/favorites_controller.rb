class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    Favorite.create(user_id: current_user.id, post_id: params[:post_id])
    redirect_back fallback_location: root_path
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id])
    @favorite.destroy
    redirect_back fallback_location: root_path
  end
end
