class UsersController < ApplicationController

  def show
    if params[:trip_id]
      @trip = Trip.find(params[:trip_id])
      @user = User.find(params[:id])
      @accommodations = @user.accommodations.where(trip_id: @trip.id)
      @transits = @user.transits.where(trip_id: @trip.id)
      @events = @user.events.where(trip_id: @trip.id)
    end
  end

end
