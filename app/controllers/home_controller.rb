class HomeController < ApplicationController
  def top
    @gear_powers = GearPower.all
  end
end
