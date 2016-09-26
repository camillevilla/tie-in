class EventsController < ApplicationController
    def index
    @events = Event.all

    @json = @events.map do | event |
      {
        trip_name: event.trip.name,
        trip_id: event.trip_id,
        creator_id: event.creator_id,
        creator_first_name: event.creator.first_name,
        creator_last_name: event.creator.last_name,
        name: event.name,
        description: event.description,
        start_time: pretty_date(event.start_time),
        end_time: pretty_date(event.end_time),
        location: event.location,
        privacy: event.privacy
      }
    end
    render :json => @json
  end
end
