module AvailabilitiesHelper
	def ftime
		x = (0..24).map do |x|
			if x == 0 || x == 24
			 ["Midnight", x]
			elsif x > 0 && x < 12
			 ["#{x}:00 AM", x]
			elsif x==12
			 ["Noon", x]
			elsif x > 12 && x < 24
			 ["#{x-12}:00 PM", x]
			end
		end
		x.unshift(["None", nil])
	end

	def format_time(hour)
		if hour == 0 || hour == 24
			"Midnight"
		elsif hour > 0 && hour < 12
			"#{hour}:00 AM"
		elsif hour == 12
				"Noon"
		elsif hour > 12 && hour < 24
			"#{hour-12}:00 PM"
		end

	end

end
