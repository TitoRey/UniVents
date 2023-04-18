class UsersController < ApplicationController
  before_action :setup_user, only: [:show, :dashboard]
  before_action :authenticate_admin, only: [:index]
  before_action :verify_author_or_admin, only: [:show]

  # Showing all users
  def index
    respond_to do |format|
      format.html
      format.json { render json: UserDatatable.new(params, view_context: view_context) }
    end
  end

  # Dashboard => Contains User Information as well as Event information (hosted + signed-up for)
  def show
  end

  private

  def setup_user
    @user ||= User.find(params[:id])
  end

  def verify_author_or_admin
    redirect_to root_path, alert: 'Sorry, that is not your account!' unless (current_user.is_admin? || @user.id == current_user.id)
  end

end