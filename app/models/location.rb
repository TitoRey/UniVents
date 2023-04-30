class Location < ApplicationRecord
  belongs_to :event

  def full_address
    "#{street_address}, #{city}, #{zipcode}"
  end
end