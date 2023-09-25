class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :current_user

    protected

    def update_allowed_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password) }
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit( :email, :password, :current_password) }
    end
  end
