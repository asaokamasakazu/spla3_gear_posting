class UsersController < ApplicationController
  before_action :authenticate_user!, {only: [:account]}

  def list
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
  end

  def account
    @user = current_user
  end
end
