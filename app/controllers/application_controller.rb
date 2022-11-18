class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_q_post

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.
      permit(:account_update, keys: [:name, :rank, :prowess, :profile, :image])
  end

  private

  def set_q_post
    @q_post = Post.ransack(params[:q])
  end
end
