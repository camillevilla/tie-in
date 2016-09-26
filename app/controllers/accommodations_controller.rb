class AccommodationsController < ApplicationController
  def index
    @accommodations = Accommodation.all

    @json = @accommodations.map do | accommodation |
      {
        id: accommodation.id,
        creator_id: accommodation.creator_id,
        trip_id: accommodation.trip_id,
        location: accommodation.location,
        check_in: accommodation.check_in,
        check_out: accommodation.check_out
      }
    end
    render :json => @json
  end
end
