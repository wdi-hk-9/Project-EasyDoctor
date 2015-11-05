class ApplicationController < ActionController::Base
  # Implement session using cookies
  helper_method :current_user, :logged_in?, :is_doctor?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def is_doctor?
    current_user && current_user.is_doctor
  end

  def authenticate_user
    unless logged_in?
      flash[:error] = "You must be logged in to access this section of the site"
      redirect_to login_url
    end
  end

end
