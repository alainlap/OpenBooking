require 'spec_helper'
require 'factory_girl_rails'

describe Availability do
	
	it 'should take an availability entry' do
		FactoryGirl.create(:availability)
		expect(Availability.all.count).to eq(1)
	end

		

end