require 'httparty'

class Location < ApplicationRecord
  include HTTParty

  has_many :accommodations
  has_many :events
  has_many :trips

  # Return address in serialized form for google maps
  def address_string
    split_address = street_address_1.split(" ").join("+")
    "#{split_address},+#{city},+#{state}"
  end

  # Return latitude and longitude for this location
  # Or return nil if no address defined
  def coordinates

      # p loc = address_string
      # geoAPI = "https://maps.googleapis.com/maps/api/geocode/json?address=#{loc}&key=#{Rails.application.secrets.google_api_key}"
      # p geoAPI
      # response = HTTParty.get(geoAPI)
      # p "*"*80
      # p response
      # p longitude = response["results"][0]["geometry"]["location"]["lng"]
      # p latitude = response["results"][0]["geometry"]["location"]["lat"]
      # [latitude, longitude]


    location = Geocoder.search(address_string)
    [location[0].latitude, location[0].longitude]
  end

end

#https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=YOUR_API_KEY

