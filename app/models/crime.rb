class Crime < ActiveRecord::Base
  attr_accessible :block, :crime_type, :date, :description, :latitude, :location_type, :longitude, :address
  
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  
end
