class UsersController < ApplicationController
  before_action :authenticate_user!, { only: [:account] }
  before_action :set_q, { only: [:search, :list] }

  def list
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
  end

  def account
    @user = current_user
  end

  def search
    @results = @q.result.order(created_at: :desc)
  end

  private

  def set_q
    @q = User.ransack(params[:q])
  end
end
