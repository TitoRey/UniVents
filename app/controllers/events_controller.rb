class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
  before_action :convert_event_time, only: %i[ create update ]

  # GET /events or /events.json
  def index
    @events = Event.all
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
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
