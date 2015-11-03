class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    # destroy
    @user.destroy
    # redirect_to
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:is_doctor, :name, :mobile, :email, :password, :password_confirmation, :district, :address)
  end
end
