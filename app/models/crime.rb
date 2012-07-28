class Crime < ActiveRecord::Base
  attr_accessible :block, :crime_type, :date, :description, :latitude, :location_type, :longitude
end
