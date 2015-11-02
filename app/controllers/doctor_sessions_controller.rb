class DoctorSessionsController < ApplicationController
  def new
  end

  # Authentication logic
  def create
    doctor = Doctor.find_by_email(params[:email])

    # email_found && params[:password] == hashed_password ?
    if doctor && doctor.authenticate(params[:password])
      doctor_session[:doctor_id] = doctor.id     #added this line to implement session using cookies
      redirect_to doctors_path, notice: "logged in!"
    else
     flash.now.alert = "invalid login credentials"
     render "new"  # sessions#new
    end
  end

  def destroy
    doctor_session[:doctor_id] = nil     # add this line to implement session using cookie
    redirect_to root_url, notice: "logged out!"
  end
end
