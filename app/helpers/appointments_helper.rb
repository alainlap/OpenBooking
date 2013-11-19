module AppointmentsHelper
	def appoint_lengths
		a = %w(1\ hour 2\ hours 3\ hours 4\ hours)
		b = [1, 2, 3, 4]
		a.zip(b)
	end

end
