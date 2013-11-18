class Appointment < ActiveRecord::Base
	belongs_to :client
	belongs_to :provider
	validates_presence_of :start_datetime, :end_datetime, :reason

end
