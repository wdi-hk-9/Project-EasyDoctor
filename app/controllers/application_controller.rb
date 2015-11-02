class ApplicationController < ActionController::Base
  # Implement session using cookies
  helper_method :current_user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  helper_method :current_doctor
  def current_doctor
    @current_doctor ||= Doctor.find(session[:doctor_id]) if session[:doctor_id]
  end

  def logged_in?
    !!current_doctor
  end

end
