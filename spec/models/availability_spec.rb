require 'spec_helper'
require 'factory_girl_rails'

describe Availability do

	xit 'should take a new availability' do

	end
	
	xit 'should take an availability entry' do
		FactoryGirl.create(:availability)
		expect(Availability.all.count).to eq(1)
	end

		

end