class FavoritesController < ApplicationController
  before_action :authenticate_user

  def create
    @post = Post.find(params[:post_id])
    Favorite.create(user_id: current_user.id, post_id: params[:post_id])
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id])
    favorite.destroy
  end

  # ajax通信ではdeviseのauthenticate_user!が使えないため独自に定義
  def authenticate_user
    if current_user.nil?
      flash[:alert] = "アカウント登録もしくはログインしてください。"
      redirect_to new_user_session_path
    end
  end
end
