class TripsController < ApplicationController
  helper ApplicationHelper
  skip_before_filter  :verify_authenticity_token

  def index
    @user = User.find(params[:id])
    @user_trips = @user.trips
  end

  def new
    @user = current_user
    @trip = Trip.new
  end

  def create
    @user = current_user
    @location = Location.new(location_params)
    if @location.save
      @trip = Trip.new(trip_params.merge(creator_id: @user.id, location_id: @location.id))
      if @trip.save
        @trip.users << @user
        redirect_to @trip
      else
        @errors = @trip.errors.full_messages
        render 'new'
      end
    else
      @errors = @location.errors.full_messages
      render 'new'
    end
  end

  def show
    @user = current_user
    @trip = Trip.find(params[:id])
  end

  def friends
    @user = current_user
    @trip = Trip.find(params[:trip_id])
  end

  def invite
    p"*"*80
    p params
    @user = current_user
    @trip = Trip.find(params[:trip_id])
    @friend = User.find(params[:friend])
  end

  def json
    @trip = Trip.find(params[:id])
    render json: @trip.json_data
  end

  def timeline
    @trip = Trip.find(params[:id])
    @events = @trip.events
    @users = @trip.users
  end

  def location_json
    @trip = Trip.find(params[:id])
    render json: @trip.all_locations_json
  end

  def map
    @trip = Trip.find(params[:id])
    @key = Rails.application.secrets.google_api_key
    @accommodations = @trip.accommodations
  end

  def find_event
    @event = Event.find(params[:id])
    @trip = @event.trip
    render @event, layout: false
  end

  def join
    @user = current_user
    @trip = Trip.find(params[:id])
    @trip.users << @user
    redirect_to trip_path
  end

  def edit
    @trip = Trip.find(params[:id])
    @location = @trip.location
  end

  def update
    @trip = Trip.find(params[:id])
    @location = @trip.location
    if @location.update(location_params)
      if @trip.update(trip_params)
        redirect_to @trip
      else
        @errors = @trip.errors.full_messages
        render 'edit'
      end
    else
      @errors = @location.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    # Do we need confirmation of some sort?
    @trip.destroy
    redirect_to trips_path
  end

  private
  def trip_params
    params.require(:trip).permit(:name, :location_id, :description, :start_date, :end_date)
  end
  def location_params
    params.require(:location).permit(:name, :street_address_1, :street_address_2, :city, :state, :zipcode)
  end
end
