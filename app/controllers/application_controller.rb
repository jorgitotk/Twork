class ApplicationController < ActionController::Base

  before_action :set_controller, :authenticate_user!
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password, :phone, :permission_level) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password, :phone, :permission_level) }
  end

  def set_controller
    @controller = params[:controller]
  end

end
