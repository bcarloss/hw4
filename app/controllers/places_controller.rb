class PlacesController < ApplicationController
  before_action :require_login, except: [:index, :show]

  def index
    if current_user
      @places = current_user.places
    else
      redirect_to login_path, alert: 'You must be logged in to access this section'
    end
  end

  def show
    @place = current_user.places.find(params[:id])
    @entries = @place.entries
  rescue ActiveRecord::RecordNotFound
    redirect_to places_path, alert: 'Place not found or not accessible.'
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

