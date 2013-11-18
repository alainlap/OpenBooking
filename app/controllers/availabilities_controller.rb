class AvailabilitiesController < ApplicationController
	def new
		
	end

	def create
		
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end

	private
	def availabilities_params
		params.require(:availability).permit(:day, :start_time, :end_time)
	end
end
