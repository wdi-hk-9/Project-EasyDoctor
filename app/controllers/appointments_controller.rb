class AppointmentsController < ApplicationController

  def create
    datetime = DateTime.parse(params[:appointment][:datetime])
    @appointment = Appointment.new
    @appointment.datetime = datetime
    @appointment.user_id = current_user.id
    @appointment.doctor_id = params[:appointment][:doctor_id]
    if @appointment.save

    else

    end
  end

  private
  def appointment_params
    params.require(:appointment).permit(:datetime, :doctor_id)
  end

end
