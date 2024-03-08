class SessionsController < ApplicationController
  # This action renders the login form.
  def new
  end

  # This action handles the login logic.
  def create
    # Find the user by email, downcasing to match the email format in the database.
    user = User.find_by(email: params[:session][:email].downcase)
    
    # Authenticate the user.
    if user && user.authenticate(params[:session][:password])
      # If the user is authenticated, set the user id in the session to log them in.
      session[:user_id] = user.id
      # Redirect to the places path with a success message.
      redirect_to places_path, notice: 'Logged in successfully.'
    else
      # If authentication fails, show an alert message and render the login form again.
      flash.now[:alert] = 'Invalid email or password.'
      render :new
    end
  end

  # This action handles the logout logic.
  def destroy
    # Remove the user id from the session to log out the user.
    session.delete(:user_id)
    # Clear the current_user variable, if it's being used.
    @current_user = nil
    # Redirect to the login path with a success message.
    redirect_to login_path, notice: 'Logged out successfully.'
  end
end


  