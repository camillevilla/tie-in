class UsersController < ApplicationController

  def index
  end
  def trip
    @user = User.find(params[:user_id])
    @trip = Trip.find(params[:id])

  end
end
