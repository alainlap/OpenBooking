class Appointment < ActiveRecord::Base
	belongs_to :client
	belongs_to :provider
	validates_presence_of :start_datetime, :end_datetime, :reason

	validate :slot_available?

	def slot_available?
    req_start = self.start_datetime
    req_end = self.end_datetime

    availability_on_day = self.provider.availabilities.find_by_day(req_start.wday)

    if availability_on_day.nil?
    	errors.add(:start_datetime, "#{self.provider.name} is not available on that day.") 
    else
	    errors.add(:start_datetime, "Your appointment starts too early.") if req_start.hour < availability_on_day.start_time
	 		errors.add(:start_datetime, "Your appointment starts too late.") if req_start.hour >=availability_on_day.end_time
	    errors.add(:end_datetime, "Your appointment cannot end before it starts!") if req_end.hour < req_start.hour
	    errors.add(:end_datetime, "Your appointment runs too late.") if req_end.hour > availability_on_day.end_time
	  end
  end
end
