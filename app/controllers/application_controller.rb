class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :membership_type, :first_name, :last_name, :member_since) }
    devise_parameter_sanitizer.for(:accept_invitation) << [ :first_name, :last_name ]
    devise_parameter_sanitizer.for(:invite) << [ :membership_type, :first_name, :last_name, :member_since ]
  end

  def authenticate_admin!
    unless current_user.is_admin?
      redirect_to user_root_url, alert: "You do not have access to this page"
  end
end
