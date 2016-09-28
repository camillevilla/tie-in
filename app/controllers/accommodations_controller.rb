class AccommodationsController < ApplicationController
  def index
    # /accommodations
    # @accommodations = Accommodation.all

    # /trips/1/accommodations
    if params[:trip_id]
      @trip = Trip.find(params[:trip_id])
      @accommodations = @trip.accommodations
    end

    # /trips/1/users/1/accommodations
  end

  def my_accommodations
    # trips/1/my_accommodations
    @trip = Trip.find(params[:trip_id])
    # @accommodations =
  end

  def show
     @accommodation = Accommodation.find(params[:id])
  end

  def new
    @accommodation = Accommodation.new
  end

  def edit
    @accommodation = Accommodation.find(params[:id])
  end

  def create
    @accommodation = Accommodation.new(accommodation_params)

    if @accommodation.save
      redirect_to accommodation_path(@accommodation)
    else
      render :new
    end
  end

  def update
    @accommodation = Accommodation.find(params[:id])

    if @accommodation.update(accommodation_params)
      redirect_to @accommodation
    else
      render 'edit'
    end
  end

  def destroy
    @accommodation = Accommodation.find(params[:id])
    @accommodation.destroy

    redirect_to accommodations_path
  end

  private

  def accommodation_params
    params.require(:accommodation).permit(:creator_id, :trip_id, :location_id, :check_in, :check_out )
  end
end
