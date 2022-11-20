class HomeController < ApplicationController
  def top
    @latest_posts = Post.includes(user: { image_attachment: :blob }).order(created_at: :desc)
    @popular_posts = Post.includes(user: { image_attachment: :blob }).order(created_at: :desc).
      sort { |a, b| b.favorited_users.size <=> a.favorited_users.size }
    @users = User.includes(:posts).with_attached_image.order(created_at: :desc)
    @gear_powers = GearPower.all
  end
end
