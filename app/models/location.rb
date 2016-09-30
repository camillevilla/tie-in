require 'httparty'

class Location < ApplicationRecord
  include HTTParty

  has_many :accommodations
  has_many :events
  has_many :trips

  def address_string
    split_address = street_address_1.split(" ").join("+")
    "#{split_address},+#{city},+#{state}"
  end

  def coordinates
    loc = address_string
    geoAPI = "https://maps.googleapis.com/maps/api/geocode/json?address=#{loc}&key=AIzaSyBCKEhZqZl8_JNUap2rtCfa50HrvkFv6QU"
    response = HTTParty.get(geoAPI)
    longitude = response["results"][0]["geometry"]["location"]["lng"]
    latitude = response["results"][0]["geometry"]["location"]["lat"]
    [latitude, longitude]
  end

end
