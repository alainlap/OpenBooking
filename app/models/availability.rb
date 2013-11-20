class Availability < ActiveRecord::Base
	belongs_to :provider

	WDAYS = [
		["Sunday", 0],
		["Monday", 1],
		["Tuesday", 2],
		["Wednesday", 3],
		["Thursday", 4],
		["Friday", 5],
		["Saturday", 6]
	]

	def self.initializer(provider_id)

		WDAYS.each do |day|
			avail = Availability.new
			avail.day = day[1]
			avail.start_time = nil
			avail.end_time = nil
			avail.provider_id = provider_id
			avail.save
		end
	end
end
