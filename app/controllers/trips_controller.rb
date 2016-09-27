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

  def show
    @trip = Trip.find(params[:id])
  end

  def create
    @current_user = User.first # Need to change this once we have an actual current user!
    @newTrip = Trip.new(
        name: params["name"],
        location: params["location"],
        description: params["description"],
        start_date: Date.parse(params["start_date"]),
        end_date: Date.parse(params["end_date"])
      )

    @newTrip.creator_id = @current_user.id

    if @newTrip.save
      # Automatically make user a member of her own trip
      @newTrip.users << @current_user
      @current_user.trips << @newTrip
      render :json =>
      {
        status: "ok",
        message: "Trip saved!",
        object: @newTrip
      }.to_json
    else
      render :json =>
      {
        status: "error",
        message: @newTrip.errors.full_messages.to_sentence,
        object: @newTrip
      }.to_json
    end
  end
end
