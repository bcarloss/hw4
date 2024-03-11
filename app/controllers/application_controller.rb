class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :user_signed_in?

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  # Alias the logged_in? method as user_signed_in? for compatibility
  alias user_signed_in? logged_in?

  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_path # Adjust as necessary for your login route
    end
  end
end


