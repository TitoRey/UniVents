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
        format.html { redirect_to event_path(@location.event), notice: "Location was successfully created." }
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
      params.require(:location).permit(:street_address, :city, :zipcode, :county, :city, :coordinates, :event_id, :is_virtual, :url)
    end
end
