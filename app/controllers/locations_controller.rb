class LocationsController < ApplicationController


  # GET /locations/new
  def new
    @location = Location.new
  end

  # POST /locations or /locations.json
  def create
    @location = Location.new(location_params)
    
    respond_to do |format|
      if @location.save
        Location.where.not(id: @location.id).where(event_id: @location.event_id).destroy_all

        format.html { redirect_to event_url(@location.event_id), notice: "Location has been created for the event" }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    
    # Only allow a list of trusted parameters through.
    def location_params
      params.fetch(:location, {})
    end
end
