class Location < ApplicationRecord
  belongs_to :event
  after_create :remove_previous_locations

  def full_address
    "#{street_address}, #{city}, #{zipcode}"
  end

  def remove_previous_locations
    Location.where(event_id: event_id).where.not(id: id).destroy_all
  end
end