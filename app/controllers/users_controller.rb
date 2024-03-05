class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Log in the user
      session[:user_id] = @user.id
      # Redirect to the places path
      redirect_to places_path, notice: 'Account was successfully created.'
    else
      # If save fails, render the new user form again
      render :new
    end
  end

  private

  # Strong parameters to prevent mass assignment vulnerability
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
