class AppointmentsController < ApplicationController
  before_action :authenticate_user

  def index # patients
    @appointments = current_user.doctor_appointments
  end

  def doctor_index # doctor
    @appointments = current_user.user_appointments.order(:datetime)
    @unconfirmed = @appointments.where(status: nil)
  end

  def new # patients
    @appointment = Appointment.new
    @appointment.doctor_id = params[:user_id].to_i
  end

  def create # patients
    @appointment = Appointment.new
    @appointment.datetime = DateTime.parse(params[:appointment][:datetime])
    @appointment.user_id = current_user.id
    @appointment.doctor_id = params[:user_id].to_i
    if @appointment.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def confirm # doctor
    update_status("Confirmed")
  end

  def reject # doctor
    update_status("Rejected")
  end

  private
  def update_status (status)
    @appointment = Appointment.find(params[:id])
    @appointment.assign_attributes(update_params)
    if @appointment.save
      redirect_to doctors_appointments_path
    else
      flash[:error] = @appointment.errors
      redirect_to doctors_appointments_path
    end
  end

  def appointment_params
    params.require(:appointment).permit(:datetime)
  end

  def update_params
    params.require(:appointment).permit(:status)
  end
end
