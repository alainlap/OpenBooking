module AvailabilitiesHelper
	def ftime
		(0..23).map do |x| 
			if x == 0
			 ["Midnight", x]				
			elsif x > 0 && x < 12
			 ["#{x}:00 AM", x]
			elsif x==12
			 ["Noon", x]
			elsif x > 12 && x < 24
			 ["#{x-12}:00 PM", x]
			end
		end
	end

	def format_time(hour)
		if hour == 0
			"Midnight"
		elsif hour > 0 && hour < 12
			"#{hour}:00 AM"
		elsif hour == 12
				"Noon"
		elsif hour > 12 && hour < 24
			"#{hour-12}:00 PM"
		end
				
	end

	def wdays
		b = %w(sunday monday tuesday wednesday thursday friday saturday)
		a = (0..6).to_a
		a.zip(b)
	end

end
