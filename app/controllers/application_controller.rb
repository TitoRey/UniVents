class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # Will only allow admins
  def authenticate_admin
    redirect_to root_path, alert: 'Unauthorized Access!' unless current_user.is_admin?
  end
end