class Availability < ActiveRecord::Base
	belongs_to :provider
	# validates_presence_of :day, :start_time, :end_time
end
