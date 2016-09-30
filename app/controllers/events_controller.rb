class EventsController < ApplicationController
    def index
      @trip = Trip.find(params[:trip_id])
    end

    def new
      @trip = Trip.find(params[:trip_id])
      @event = Event.new()
    end

  def create
    @trip = Trip.find(params[:trip_id])
    @location = Location.new(location_params)
    if @location.save
      @event = Event.new(event_params.merge(trip_id: @trip.id, creator_id: current_user.id, location_id: @location.id))
      @event.creator_id = current_user.id
      @event.trip_id = @trip.id
      @event.users << current_user
      if @event.save
        redirect_to trip_event_path(@trip, @event)
      else
        @errors = @event.errors.full_messages
        render 'new'
      end
    else
      @errors = @location.errors.full_messages
      render 'new'
    end
  end

  def show
    p "*" * 80
    p params
    @trip = Trip.find(params[:trip_id])
    @event = Event.find(params[:id])
  end

  def join
    @user = current_user
    @event = Event.find(params[:id])
    if @event && @user && !@event.users.include?(@user)
      @event.users << @user
    end
    redirect_to trip_event_path
  end

  def edit
    @trip = Trip.find(params[:trip_id])
    @event = Event.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:trip_id])
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to trip_event_path(@trip, @event)
    else
      @errors = @event.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    # Do we need confirmation of some sort?
    @event.destroy
    redirect_to events_path
  end

  private
  def event_params
    params.require(:event).permit(:name, :creator_id, :trip_id, :location_id, :description, :start_time, :end_time, :privacy)
  end
  def location_params
    params.require(:location).permit(:name, :street_address_1, :street_address_2, :city, :state, :zipcode)
  end

end
