class SessionsController < ApplicationController
  def new
  end

  # Authentication logic
  def create
    user = User.find_by_email(params[:email])

    # email_found && params[:password] == hashed_password ?
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "logged in!"
    else
     flash.now.alert = "invalid login credentials"
     render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "logged out!"
  end
end
