class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: lambda { |exception| render_error 500, exception }
    rescue_from ActionController::RoutingError, ActionController::UnknownController, ::AbstractController::ActionNotFound, ActiveRecord::RecordNotFound, with: lambda { |exception| render_error 404, exception }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :membership_type, :first_name, :last_name, :member_since) }
    devise_parameter_sanitizer.for(:accept_invitation) << [ :first_name, :last_name ]
    devise_parameter_sanitizer.for(:invite) << [ :membership_type, :first_name, :last_name, :member_since ]
  end

  def authenticate_admin!
    unless current_user.is_admin?
      redirect_to user_root_url, alert: "You do not have access to that page"
    end
  end

  def authenticate_inviter!
    authenticate_admin!
  end

  def render_error(status, exception)
    logger.error "ERROR: #{status} || #{exception.inspect}"  #{exception.backtrace.join('')} will log full backtrace if needed for troubleshooting
    logger.error "USER ID: #{current_user.id}" if user_signed_in?
    respond_to do |format|
      format.html { render template: "errors/error_#{status}", layout: 'layouts/application', status: status }
      format.all { render nothing: true, status: status }
    end
  end
end
