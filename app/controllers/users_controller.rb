class UsersController < ApplicationController
  before_action :authenticate_user, only: [:dashboard]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_dashboard_path
    else
      render 'new'
    end
  end

  def dashboard
    @appointments = Appointment.all
    @doctors = User.where(is_doctor: true)
  end

  private
  def user_params
    params.require(:user).permit(:is_doctor, :name, :mobile, :email, :password, :password_confirmation, :district, :address)
  end
end
