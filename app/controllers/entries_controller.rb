class EntriesController < ApplicationController
  before_action :require_login

  # 'new' action to display the form for a new entry
  def new
    @place = current_user.places.find(params[:place_id])
    @entry = @place.entries.build
  end

  # 'create' action to handle form submission
  def create
    @place = current_user.places.find(params[:place_id])
    @entry = @place.entries.build(entry_params.merge(user: current_user))
    if @entry.save
      redirect_to place_path(@place), notice: 'Entry was successfully created.'
    else
      render :new
    end
  end

  private
  
  def entry_params
    params.require(:entry).permit(:title, :description, :occurred_on, :image)
  end
end
