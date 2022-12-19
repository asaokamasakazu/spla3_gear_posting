class UsersController < ApplicationController
  before_action :authenticate_user!, { only: [:account] }
  before_action :set_q, { only: [:search, :list] }

  def list
    @users = User.includes(:posts).with_attached_image.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
    @user_favorites = @user.favorites.includes(post: { user: { image_attachment: :blob } }).
      order(created_at: :desc)
  end

  def account
    @user = current_user
  end

  def search
    @results = @q.result.includes(:posts).with_attached_image.order(created_at: :desc)
  end

  def precomplete
  end

  private

  def set_q
    @q = User.ransack(params[:q])
  end
end
