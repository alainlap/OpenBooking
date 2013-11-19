module AvailabilitiesHelper
	def ftime
		(1..24).map { |x| x <= 12 ? ["#{x}:00 AM", x] : ["#{x-12}:00 PM", x] }
	end

	def format_time(hour)
		hour <= 12 ? "#{hour}:00 AM" : "#{hour-12}:00 PM"
	end

	def wdays
		b = %w(sunday monday tuesday wednesday thursday friday saturday)
		a = (0..6).to_a
		a.zip(b)
	end

end
