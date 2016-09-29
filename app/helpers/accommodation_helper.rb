module AccommodationHelper
	require 'httparty'
  
  	include HTTParty

	  def attending?(user)
	    @accommodation.users.include?(user)
	  end

	  def geocoding(address)
	  	response = HTTParty.get(address)

	  	@locations = []
      @accommodations.each do |accommodation|
        @locations << accommodation.location_id
      end

      @location_string = []

      @locations.each do |loc|
        thePlace = Location.find(loc)
        street = thePlace.street_address_1

        splits = street.split(" ").join("+")

        city = thePlace.city
        state = thePlace.state
        zip = thePlace.zipcode

        allthestrings = "#{splits},+#{city},+#{state}"
        @location_string << allthestrings
      end

      # googleAPI = AccommodationHelper.new
      
      @location_string.each do |loc|
        geoAPI = "https://maps.googleapis.com/maps/api/geocode/json?address=#{loc}&key=AIzaSyBCKEhZqZl8_JNUap2rtCfa50HrvkFv6QU" 
        longitude = geocoding(geoAPI).parsed_response["results"][0]["geometry"]["location"]["lng"]
        latitude = geocoding(geoAPI).parsed_response["results"][0]["geometry"]["location"]["lat"]
      end

		end
end
