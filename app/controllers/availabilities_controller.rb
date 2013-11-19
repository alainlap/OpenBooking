class AvailabilitiesController < ApplicationController
	before_action :set_provider

	def new
		@availability = Availability.new
		@availabilities = Array.new(7) { @provider.availabilities.build }
	end

	def create
		


		@availability = Availability.new(param)
		if @availability.save
    	redirect_to :back , notice: 'Availability successfully created.'
  	else
  	  render action: 'new'
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
		params.require(:availability).permit(:day, :start_time, :end_time, :availabilities)
	end

	def set_provider
		@provider = current_user.provider
		@user = current_user
	end
end
