class Appointment < ActiveRecord::Base
	belongs_to :client
	belongs_to :provider
	validates_presence_of :start_datetime, :end_datetime, :reason

	validate :slot_available?
	validate :duplicate_client_booking?
	validate :duplicate_provider_booking?
  validate :booking_into_past?

	def slot_available?
    availability_on_day = self.provider.availabilities.find_by_day(start_datetime.wday)

    if availability_on_day.nil?
    	errors.add(:start_datetime, "#{self.provider.name} is not available on that day.") 
    else
	    errors.add(:start_datetime, "Your appointment starts too early") if start_datetime.hour < availability_on_day.start_time
	 		errors.add(:start_datetime, "Your appointment starts too late") if start_datetime.hour >=availability_on_day.end_time
	    errors.add(:start_datetime, "Your appointment cannot end before it starts!") if end_datetime.hour < start_datetime.hour
	    errors.add(:start_datetime, "Your appointment runs too late") if end_datetime.hour > availability_on_day.end_time
	  end
  end

  def duplicate_provider_booking?

    relevant_appointments = if id.present?
      provider.appointments.where("id != ?", id)
    else
      provider.appointments
    end

    if relevant_appointments.where("? > start_datetime AND ? <= end_datetime", end_datetime, end_datetime).present?
      errors.add(:start_datetime, "Your end time overlaps an existing appointment") 
    end

  	if relevant_appointments.where("? >= start_datetime AND ? < end_datetime", start_datetime, start_datetime).present?
      errors.add(:start_datetime, "Your start time overlaps an existing appointment") 
    end

  	if relevant_appointments.where("? <= start_datetime AND ? >= end_datetime", start_datetime, end_datetime).present?
      errors.add(:start_datetime, "Your appointment completely overlaps an existing appointment") 
    end
  end

   def duplicate_client_booking?
    
    relevant_appointments = if id.present?
      client.appointments.where("id != ?", id)
    else
      client.appointments
    end

    if relevant_appointments.where("? > start_datetime AND ? <= end_datetime", end_datetime, end_datetime).present?
    	return errors.add(:start_datetime, "You have another appointment at this time") 
    end

    if relevant_appointments.where("? >= start_datetime AND ? < end_datetime", start_datetime, start_datetime).present?
    	return errors.add(:start_datetime, "You have another appointment at this time") 
    end

    if relevant_appointments.where("? <= start_datetime AND ? >= end_datetime", start_datetime, end_datetime).present?
    	errors.add(:start_datetime, "You have another appointment at this time") 
    end
  end

  def booking_into_past?
    if self.start_datetime < DateTime.now
      errors.add(:start_datetime, "You cannot make an appointment in the past")
    end
  end

end

