class HomeController < ApplicationController
  def top
    @posts = Post.all.order(created_at: :desc)
    @users = User.all.order(created_at: :desc)
    @gear_powers = GearPower.all
  end
end
