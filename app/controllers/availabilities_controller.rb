class AvailabilitiesController < ApplicationController
	before_action :set_provider

	def index
		@availabilities = @provider.availabilities.order(:id)
	end

	def update
		@availability = Availability.find(params[:id])
		@availabilities = @provider.availabilities.order(:id)

		respond_to do |format|

			if @availability.update(availabilities_params)

	    	format.html {redirect_to user_provider_availabilities_path(@user, @provider), flash: {success: 'Availability successfully saved.'}}
	    	format.js
	  	else
	  		format.html {			
	  	  	flash[:alert] = "Please try again!"
	  	  	render 'index'
	  	  }
	  	  format.js
	  	end
  	end
	end

	def destroy
		@availability = Availability.find(availabilities_params[:id])
		@availability.destroy
	end

	private
	def availabilities_params
		params.require(:availability).permit(:day, :start_time, :end_time, :provider_id)
	end

	def set_provider
		@provider = current_user.provider
		@user = current_user
	end
end
