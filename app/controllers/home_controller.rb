class HomeController < ApplicationController
  def top
    @users = User.all.order(created_at: :desc)
    @gear_powers = GearPower.all
  end
end
