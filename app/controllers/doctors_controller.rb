class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to doctors_path
    else
      render 'new'
    end
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    # destroy
    @doctor.destroy
    # redirect_to
    redirect_to doctors_path
  end

  private
  def doctor_params
    params.require(:doctor).permit(:name, :district, :address, :phone, :password, :password_confirmation)
  end
end
