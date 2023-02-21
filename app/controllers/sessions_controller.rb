class SessionsController < ApplicationController
  skip_before_action :authorize_logged_in

  def new
    if @logged_user
      redirect_to users_path
    end
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user.present?
      if @user.password = params[:password]
        session[:user_id] = @user.id
        redirect_to users_path, sucess: "Logged in!"
      else
        redirect_to new_session_path, error: "Incorrect Password!"
      end
    else 
      redirect_to new_session_path, warning: "User does not exist!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to signin_path, success: "Logged Out!"
  end

end