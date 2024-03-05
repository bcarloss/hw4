class PlacesController < ApplicationController
  before_action :require_login

  def index
    @places = current_user.places
  end

  def show
    @place = current_user.places.find(params[:id])
    @entries = @place.entries
  end

  def new
    @place = Place.new
  end

  def create
    @place = current_user.places.build(place_params)
    if @place.save
      redirect_to places_path, notice: 'Place was successfully created.'
    else
      render :new
    end
  end

  private

  def place_params
    params.require(:place).permit(:name)
  end

  def require_login
    redirect_to login_path unless current_user
  end
end

