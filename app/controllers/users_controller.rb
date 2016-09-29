class UsersController < ApplicationController

  def show
    if params[:trip_id]
      @trip = Trip.find(params[:trip_id])
      @user = User.find(params[:id])
      @accommodations = @user.accommodations
      @transits = @user.transits
      @events = @user.events
    end
  end

end
