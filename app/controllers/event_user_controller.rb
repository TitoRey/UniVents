class EventUserController < ApplicationController
  before_action :setup_registration, only: [ :destroy ]
  before_action :authenticate_user 

  def create
    @event_user = EventUser.new(filtered_params)
    respond_to do |format|
      if @event_user.save
        format.html { redirect_to event_url(@event_user.event), notice: 'You are now registered for this event!'}
        format.json { render :show, status: :created }
      else
        format.html { redirect_to event_url(@event_user.event), alert: 'There was an issue registering for this event, please try again later.'}
        format.json { render json: @event_user.errors, status: :unprocessable_entity }
      end
    end
    

  end

  def destroy
    @event_user.destroy
    respond_to do |format|
      format.html { redirect_to event_path(@event_user.event), notice: "You are no longer registered for this event!"}
      format.json { head :no_content}
    end 
  end

  private 
  
  def filtered_params
    params.require(:event_user).permit(:user_id, :event_id)
  end

  def setup_registration
    @event_user ||= EventUser.find_by(user_id: params[:user_id], )
  end

  def authenticate_user
    redirect_to root_path, alert: 'This is not your account!' unless current_user.id == params[:user_id].to_i
  end

end