class TripsController < ApplicationController
  helper ApplicationHelper
  # skip_before_filter  :verify_authenticity_token

  def index
    @user = User.find(params[:id])
    @user_trips = @user.trips
  end

  def new
    @user = current_user || User.first
    @trip = Trip.new
  end

  def create
    @user = current_user || User.first
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
    @trip = Trip.find(params[:id])
  end

  private
  def trip_params
    params.require(:trip).permit(:name, :location, :description, :start_date, :end_date)
  end
end
