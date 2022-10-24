class GearPowersController < ApplicationController
  def index
    @gear_powers = GearPower.all
  end

  def show
  end
end
