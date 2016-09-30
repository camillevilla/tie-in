module AccommodationHelper
	require 'httparty'

  	include HTTParty

	  def attending?(user)
	    @accommodation.users.include?(user)
	  end

	  def geocoding(address)
	  	response = HTTParty.get(address)
    end

    def delete_this_method
	  	@locations = []
      @accommodations.each do |accommodation|
        @locations << accommodation.location_id
      end

      @location_string = []

      @locations.each do |loc|
        thePlace = Location.find(loc)
        @location_string << allthestrings
      end

      # googleAPI = AccommodationHelper.new

      @location_string.each do |loc|
        geoAPI = "https://maps.googleapis.com/maps/api/geocode/json?address=#{loc}&key=#{Rails.application.secrets.google_api_key}"
        longitude = geocoding(geoAPI).parsed_response["results"][0]["geometry"]["location"]["lng"]
        latitude = geocoding(geoAPI).parsed_response["results"][0]["geometry"]["location"]["lat"]
      end

		end
end
