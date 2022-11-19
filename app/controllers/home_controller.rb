class HomeController < ApplicationController
  def top
    @latest_posts = Post.all.order(created_at: :desc)
    @popular_posts = Post.order(created_at: :desc).includes(:favorited_users).sort { |a, b| b.favorited_users.size <=> a.favorited_users.size }
    @users = User.all.order(created_at: :desc)
    @gear_powers = GearPower.all
  end
end
