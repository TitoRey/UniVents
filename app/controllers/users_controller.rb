class UsersController < ApplicationController
  before_action :setup_user, except: [:index]

  # Showing all users
  def index
    @users = User.all
  end

  # We will show the account information here
  def show
    unless current_user.is_admin? || @user == current_user
      redirect_to root_path, notice: 'Sorry, that is not your account!'
    end
  end

  def dashboard

  end

  private

  def setup_user
    @user ||= User.find(params[:id])
  end

end