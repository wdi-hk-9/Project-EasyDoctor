class UsersController < ApplicationController
  before_action :authenticate_user, only: [:dashboard]
  def new
    @user = User.new
  end

  def create
    # puts DateTime.parse(params[:appointment][:datetime])
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def dashboard
    @appointments = Appointment.all
  end

  private
  def user_params
    params.require(:user).permit(:is_doctor, :name, :mobile, :email, :password, :password_confirmation, :district, :address)
  end
end
