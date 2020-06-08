class AppointmentsController < ApplicationController
  before_action :set_physician, except: [:index, :show]
  # before_action :set_patient
  def index
  #   @test = 1
  #   @appointment = @patient.appointments.new
  #   @physicians = Physician.all
   end

  def new
    # @test = 0
     @appointment = @physician.appointments.new
     @patients = Patient.all
  end

  def create

    # if @test == 0

        @appointment = @physician.appointments.new(appointment_params)
        if @appointment.save
          redirect_to physician_path(@physician)
        else
        render :index
        
        end


      # elsif @test == 1
    
      #   @appointment = @patient.appointments.new(appointment_params)
      #   if @appointment.save
      #     redirect_to patient_path(@patient)
      #   else
      #   render :index
        
      #   end

    
    # end
    end

  def edit
    
    @appointment = @physician.appointments.new
    @patients = Patient.all
  end

  def show
    @appointment = Appointment.find(params[:id])
    @patients = Patient.all
    @physicians = Physician.all
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

  # def set_patient
  #   @patient = Patient.find(params[:patient_id])
  # end

end
