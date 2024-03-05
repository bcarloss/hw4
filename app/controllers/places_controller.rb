class PlacesController < ApplicationController
  before_action :require_login, except: [:index, :show]

  def index
    @places = current_user.places
  end

  def show
    @place = current_user.places.find(params[:id])
    @entries = @place.entries
  end

  def new
    @place = current_user.places.build
  end

  def create
    @place = current_user.places.build(place_params)
    if @place.save
      redirect_to @place, notice: 'Place was successfully created.'
    else
      render :new
    end
  end

  private

  def place_params
    params.require(:place).permit(:name)
  end

  def require_login
    unless current_user
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_path
    end
  end
end
