class UsersController < ApplicationController
  before_action :setup_user, only: [:show, :dashboard, :edit, :update]
  # before_action :authenticate_admin, only: [:index]
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
    @hostedEvents = Event.where(user_id: current_user.id)
    @eventUser = EventUser.where(user_id: current_user.id)
    @registered_events = User.find(params[:id]).events
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to root_path, notice: 'Account has been successfully updated!'}
      else
        format.html { render action: 'edit'}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def setup_user
    @user ||= User.find(params[:id])
  end

  def verify_author_or_admin
    redirect_to root_path, alert: 'Sorry, that is not your account!' unless (current_user.is_admin? || @user.id == current_user.id)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :admin)
  end

end