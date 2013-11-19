require 'spec_helper'

describe AvailabilitiesController do
	
	describe 'POST create' do
		
		xit 'should redirect to...' do
			post :create, availabilities: {day: 1, start_time: 9, end_time: 17}
			expect(response).to redirect_to(user_appointments(current_user))
		end

	end

end