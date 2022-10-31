class UsersController < ApplicationController
  def list
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
  end
end
