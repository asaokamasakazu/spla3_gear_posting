class GearPowersController < ApplicationController
  def index
    @gear_powers = GearPower.all
  end

  def show
    @gear_power = GearPower.find(params[:id])
  end
end
