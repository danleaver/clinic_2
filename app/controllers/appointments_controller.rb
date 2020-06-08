class AppointmentsController < ApplicationController
  before_action :set_physician
  
  def index
    # @patients = Patient.all
    
    
    
   
  end

  def new
     
     @appointment = @physician.appointments.new
     @patients = Patient.all
  end
  def create
    @appointment = @physician.appointments.new(appointment_params)
    if @appointment.save
      redirect_to physician_path(@physician)
    else
     render :index
     
    end
  end

  def edit
  end

  def show
  end

  def destroy
    @appointment = @physician.appointments.find(params[:id])
    @appointment.destroy
    redirect_to physician_path(@physician)
  end

  private
  def appointment_params
    params.require(:appointment).permit( :appointment_date, 
    :physician_id,
    :patient_id)
  end

  def set_physician
    @physician = Physician.find(params[:physician_id])
  end
end
