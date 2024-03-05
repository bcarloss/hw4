class EntriesController < ApplicationController
  before_action :set_place, only: [:new, :create]

  def new
    @entry = @place.entries.build
  end

  def create
    @entry = @place.entries.build(entry_params)
    if @entry.save
      redirect_to place_path(@place), notice: 'Entry was successfully created.'
    else
      render :new
    end
  end

  private

  def set_place
    @place = current_user.places.find(params[:place_id])
  end

  def entry_params
    params.require(:entry).permit(:title, :description, :occurred_on, :image)
  end
end
