class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  private

  # Sets @current_user with the user found by the session user_id
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # Returns a boolean indicating if the user is logged in
  def logged_in?
    !!current_user
  end

  # Redirects to login page if user is not logged in
  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_path # Adjust as necessary for your login route
    end
  end
end

