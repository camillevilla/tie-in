class TripsController < ApplicationController
  helper ApplicationHelper
  # skip_before_filter  :verify_authenticity_token

  def index
    @user = User.find(params[:id])
    @user_trips = @user.trips
  end

  def new
    @user = current_user
    @trip = Trip.new
  end

  def create
    p trip_params
    @user = current_user
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
    @user = current_user
    @trip = Trip.find(params[:id])
  end

  def user

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
    params.require(:trip).permit(:name, :location_id, :description, :start_date, :end_date)
  end
end
