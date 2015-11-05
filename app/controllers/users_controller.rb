class UsersController < ApplicationController
  before_action :authenticate_user, only: [:dashboard]

  def index
    @districts = User.where(is_doctor: true).pluck(:district).uniq
    if params[:user]
      if params[:user][:district] #/users?district=Wan Chai
        @doctors = User.where(is_doctor: true).where(filter_params)
      end
    else #/users
      @doctors = User.where(is_doctor: true)
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.is_doctor = @user.is_doctor.to_b
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:is_doctor, :name, :mobile, :email, :password, :password_confirmation, :district, :address)
  end

  def filter_params
    params.require(:user).permit(:district)
  end
end
