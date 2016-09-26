class EventsController < ApplicationController
    def index
    @events = Event.all

    @json = @events.map do | event |
      {
        trip_id: event.trip_id,
        creator_id: event.creator_id,
        name: event.name,
        description: event.description,
        start_time: event.start_time,
        end_time: event.end_time,
        location: event.location,
        privacy: event.privacy
      }
    end
    render :json => @json
  end
end
