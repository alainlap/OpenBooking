FactoryGirl.define do

	factory :availability do
		id '1'
		day '1'
    start_time '9:00:00 -0500'
    end_time	'17:00:00 -0500'
    provider_id '1'
	end

	factory :appointment do
		id '1'
		start_datetime 'Time.now'
		end_datetime '(Time.now + 1.hour)'
		reason 'testing'
		description 'here is the description'
		provider_id '1'
		client_id '1'
	end

end