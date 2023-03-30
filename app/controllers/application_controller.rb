class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # Will only allow admins
  def authenticate_admin
  end
end