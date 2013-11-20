class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :set_provider, only: [:new, :create]
  before_action :set_user

  def index
    @i_am_client_appointments = (@user.client ? Appointment.where(["client_id = ?", @user.client.id]) : []) 
    @i_am_provider_appointments = (@user.provider ? Appointment.where(["provider_id = ?", @user.provider.id]) : []) 
  end

  def new
    @appointment = Appointment.new
  end

  def edit
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.provider_id = @provider.id
    @appointment.client_id = current_user.client.id
    @appointment.end_datetime = @appointment.start_datetime + params[:duration].to_i.hour

    if @appointment.save
      redirect_to user_appointments_path(@user), notice: 'Appointment was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to @appointment, notice: 'Appointment was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @appointment.destroy
    redirect_to user_appointments_path(@user)
  end

  private

    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:start_datetime, :duration, :reason, :description)
    end

    def set_provider
      @provider = Provider.find(params[:provider_id])
    end

    def set_user
      @user = current_user
    end
    
end
