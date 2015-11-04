class AppointmentsController < ApplicationController

  def index
    @appointment = current_user.doctor_appointments
  end

  def create
    datetime = DateTime.parse(params[:appointment][:datetime])
    @appointment = Appointment.new
    @appointment.datetime = datetime
    @appointment.user_id = current_user.id
    @appointment.doctor_id = params[:appointment][:doctor_id].to_i
    if @appointment.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def appointment_params
    params.require(:appointment).permit(:datetime, :doctor_id)
  end
end
