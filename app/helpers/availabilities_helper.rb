module AvailabilitiesHelper
	def ftime
		(1..24).map do |x| 
			if x < 12
			 ["#{x}:00 AM", x]
			elsif x==12
			 ["Noon", x]
			elsif x > 12 && x < 24
			 ["#{x-12}:00 PM", x]
			elsif x == 24
			 ["Midnight", x]
			end
		end
	end

	def format_time(hour)
		if hour < 12
			"#{hour}:00 AM"
		elsif hour > 12 && hour < 24
			"#{hour-12}:00 PM"
		elsif hour == 12
				"Noon"
		elsif hour == 24
			"Midnight"
		end
				
	end

	def wdays
		b = %w(sunday monday tuesday wednesday thursday friday saturday)
		a = (0..6).to_a
		a.zip(b)
	end

end
