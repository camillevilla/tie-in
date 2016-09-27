class TripsController < ApplicationController
  helper ApplicationHelper
  # skip_before_filter  :verify_authenticity_token

  def index
    @user = User.first
    @user_trips = @user.trips
  end

  def new
    @user = User.first
    @trip = Trip.new
  end

  def create
    @user = User.first
    @trip = Trip.new(trip_params)
    @trip.creator_id = @user.id
    if @trip.save
      @trip.users << @user
      redirect_to @trip
    else
      @errors = @trip.errors.full_messages
      render 'new'
    end
  end

  def show
    @user = User.first
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update(trip_params)
      redirect_to @trip
    else
      @errors = @trip.errors.full_messages
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
    params.require(:trip).permit(:name, :location, :description, :start_date, :end_date)
  end
end
