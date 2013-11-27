class AvailabilitiesController < ApplicationController
	before_action :set_provider

	def index
		@availabilities = @provider.availabilities.order(:id)
	end

	def update
		@availability = Availability.find(availabilities_params[:id])
		if @availability.update(availabilities_params)
    	redirect_to user_provider_availabilities_path(@user, @provider), flash: {success: 'Availability successfully saved.'}
  	else
  		@availabilities = @provider.availabilities.order(:id)
  	  flash[:alert] = "Please try again!"
  	  render 'index'
  	end
	end

	def destroy
		@availability = Availability.find(availabilities_params[:id])
		@availability.destroy
	end

	private
	def availabilities_params
		params.permit(:day, :start_time, :end_time, :provider_id, :id)
	end

	def set_provider
		@provider = current_user.provider
		@user = current_user
	end
end
