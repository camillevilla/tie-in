class AccommodationsController < ApplicationController
  def index
    @accommodations = Accommodation.all

    @json = @accommodations.map do | accommodation |
      {
        id: accommodation.id,
        creator_id: accommodation.creator_id,
        trip_id: trip_id,
        location: location,
        check_in: check_in,
        check_out: check_out
      }
    end
    render :json => @json
  end
end
