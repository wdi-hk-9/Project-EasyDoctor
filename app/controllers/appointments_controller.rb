class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
  end

  def edit
  end

  def show
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to appointments_path
    else
      render 'new'
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    # destroy
    @appointment.destroy
    # redirect_to
    redirect_to appointments_path
  end

  private
  def appointment_params
    params.require(:appointment).permit(:status, :datetime)
  end
end
