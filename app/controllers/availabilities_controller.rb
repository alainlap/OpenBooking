class AvailabilitiesController < ApplicationController
	before_action :set_provider

	def new

	end

	def create
		@availability = Availability.new(availabilities_params)
		if @availability.save
    	render action: 'new', notice: 'Availability successfully saved.'
  	else
  	  render action: 'new', notice: 'Sorry, please try again.'
  	end
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
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
