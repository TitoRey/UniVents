class UsersController < ApplicationController
  before_action :setup_user, only: [:show, :dashboard]

  # Showing all users
  def index
    respond_to do |format|
      format.html
      format.json { render json: UserDatatable.new(params, view_context: view_context) }
    end
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
    @user ||= params[:id].to_i.zero? ? current_user : User.find(params[:id])
  end

end