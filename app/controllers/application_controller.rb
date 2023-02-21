class ApplicationController < ActionController::Base
  before_action :authorize_logged_in
  add_flash_types :success, :info, :warning, :error

  def authorize_logged_in
    unless current_logged_user
      redirect_to signup_path, info: "Please login to the application"
    end
  end 

  def current_logged_user
    @logged_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end
end
