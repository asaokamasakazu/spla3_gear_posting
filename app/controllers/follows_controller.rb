class FollowsController < ApplicationController
  before_action :authenticate_user, { only: [:create, :destroy] }

  def create
    @user = User.find(params[:user_id])
    @user_following = @user.followings
    @user_followed = @user.followers
    current_user.follow(params[:user_id])
  end

  def destroy
    @user = User.find(params[:user_id])
    @user_following = @user.followings
    @user_followed = @user.followers
    current_user.unfollow(params[:user_id])
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings.includes(:posts).with_attached_image
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers.includes(:posts).with_attached_image
  end
end
