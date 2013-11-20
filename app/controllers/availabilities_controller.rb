class AvailabilitiesController < ApplicationController
	before_action :set_provider

	def index
		@availabilities = @provider.availabilities
	end

	def update
		@availability = Availability.new(availabilities_params)
		if @availability.save
    	render action: 'new', notice: 'Availability successfully saved.'
  	else
  	  render action: 'new', notice: 'Sorry, please try again.'
  	end
	end

	def destroy
		@availability.destroy
	end

	private
	def availabilities_params
		params.permit(:day, :start_time, :end_time, :provider_id)
	end

	def set_provider
		@provider = current_user.provider
		@user = current_user
	end
end
