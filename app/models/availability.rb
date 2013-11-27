class Availability < ActiveRecord::Base
	belongs_to :provider

	validate :valid_times?

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

	def valid_times?
    
    if self.start_time.nil? && self.end_time.nil?
    	return
    elsif (self.start_time.nil? && !self.end_time.nil?) || (self.end_time.nil? && !self.start_time.nil?)
    	errors.add(:start_time, "Your cannot set only one of your times as 'none'")
    elsif self.start_time > self.end_time
    	errors.add(:start_time, "Your availability cannot end before it starts")
    elsif self.start_time == self.end_time
    	errors.add(:start_time, "Your availability must last at least an hour")   
	  end
  end

end
