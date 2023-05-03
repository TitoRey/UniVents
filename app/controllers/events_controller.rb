class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy flag ]
  before_action :convert_event_time, only: %i[ create update ]
  before_action :verify_author_or_admin, only: [:edit, :update, :destroy]
  before_action :block_if_flagged, only: [:show]

  # GET /events or /events.json
  def index
    @events = Event.where(flagged: false).order("event_time asc")
    if params[:flagged].present?
      respond_to do |format|
        format.html
        format.json { render json: EventDatatable.new(params, view_context: view_context) }
      end
    elsif params[:from].present? && params[:to].present?
      @events = @events.where("event_time between :start AND :end", start: Date.parse(params[:from]).in_time_zone, end: Date.parse(params[:to]).end_of_day.in_time_zone)
      render
    elsif params[:from].present?
      @events = @events.where("event_time >= :foo", foo: Date.parse(params[:from]).in_time_zone)
    elsif params[:to].present?
      @events = @events.where("event_time <= :foo", foo: Date.parse(params[:to]).end_of_day.in_time_zone)
    end
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def flag
    boolean = params[:flag]
    @event.flag(boolean)
    respond_to do |format|
      if (@event.flagged)
        format.html { redirect_to events_url, alert: "Event has been flagged and is pending review from admins." }
      else
        format.html { redirect_to event_path(@event), notice: 'Event has been unflagged and is now visible to users.' }
      end
    end
  end

  private

    def block_if_flagged
      redirect_to events_url, notice: 'Event is currently under review as it was deemed suspicious' unless (current_user.is_admin? || !@event.flagged)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def verify_author_or_admin
      redirect_to root_path, alert: "Sorry, you do not have access to this Event's settings!" unless (current_user.is_admin? || @event.user_id == current_user.id)
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:user_id, :event_name, :event_description, :event_time)
    end

    # Convert event start date and time supplied from event form into a single DateTime object
    def convert_event_time
      if params[:event].blank?
        return
      end

      event_start_date = params[:event].delete(:event_start_date)
      event_start_time = params[:event].delete(:event_start_time)

      if event_start_date.blank? || event_start_time.blank?
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      else
        params[:event][:event_time] = event_start_date.to_datetime + Time.zone.parse(event_start_time).seconds_since_midnight.seconds
      end
    end
end
