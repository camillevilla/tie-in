class TransitsController < ApplicationController
include ApplicationHelper

  def index
    @user = current_user
    @trip = Trip.find(params[:trip_id])
    @transits = @trip.transits
  end

  def show
    @trip = Trip.find(params[:trip_id])
    @transit = Transit.find(params[:id])
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @transit = Transit.new
  end

  def edit
    @transit = Transit.find(params[:id])
  end

  def create
    @trip = Trip.find(params[:trip_id])

    @transit = Transit.new(transit_params.merge(creator_id: current_user.id, trip_id: @trip.id))
    @transit.users << current_user

    if @transit.save
      redirect_to trip_transits_path(@trip)
    else
      render :new
    end
  end

  def update
    @transit = Transit.find(params[:id])

    if @transit.update(transit_params)
      redirect_to @transit
    else
      render 'edit'
    end
  end

  def destroy
    @transit = Transit.find(params[:id])
    @transit.destroy

    redirect_to transits_path
  end
private

	# def transit_params
	# 	params.require(:transit).permit(:creator_id, :trip_id, :arrival, :transit_type, :start_time, :end_time)
	# end

  def transit_params
    params.require(:transit).permit(:creator_id, :trip_id, :arrival, :airline, :flight_number, :origin, :destination, :transit_type, :start_time, :end_time)
  end
end



