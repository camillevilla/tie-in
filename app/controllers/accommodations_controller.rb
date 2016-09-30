class AccommodationsController < ApplicationController
  skip_before_filter :verify_authenticity_token

     
  include AccommodationHelper

  def index
    # /trips/1/accommodations
    if params[:trip_id]
      @trip = Trip.find(params[:trip_id])
      @accommodations = @trip.accommodations
    end
  end

  def show
     @accommodation = Accommodation.find(params[:id])
     @trip = Trip.find(@accommodation.trip_id)
     @location = @accommodation.location
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @accommodation = Accommodation.new
    @location = Location.new
  end

  def edit
    @accommodation = Accommodation.find(params[:id])
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @location = Location.new(location_params)

    if @location.save
      @accommodation = Accommodation.new(accommodation_params.merge(trip_id: @trip.id, location_id: @location.id, creator_id: current_user.id))
      @accommodation.users << current_user
      if @accommodation.save
        redirect_to accommodation_path(@accommodation)
      end
    else
      render 'new'
    end
  end

  def update
    # @trip = Trip.find(params[:trip_id])
    # @accommodation = Accommodation.find(params[:accommodation_id])

    # if @accommodation.update(accommodation_params)
    #   redirect_to @accommodation
    # else
    #   render'edit'
    # end

    # move this to a join action later
    @trip = Trip.find(params[:trip_id])
    @accommodation = Accommodation.find(params[:id])
    @accommodation.users << current_user
    if @accommodation.save
      redirect_to accommodation_path(@accommodation)
    end
  end

  def destroy
    @accommodation = Accommodation.find(params[:id])
    @accommodation.destroy

    redirect_to accommodations_path
  end

  # custom actions
  def join
    @accommodation = Accommodation.find(params[:id])
    @accommodation.users << current_user
    if @accommodation.save
      redirect_to accommodation_path(@accommodation)
    end
  end

  private

  def accommodation_params
    params.require(:accommodation).permit(:creator_id, :trip_id, :location_id, :check_in, :check_out )
  end

  def location_params
    params.require(:location).permit(:name, :street_address_1, :street_address_2, :city, :state, :zipcode)
  end

end
