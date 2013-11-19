class Provider < ActiveRecord::Base
	belongs_to :user
	belongs_to :type
	has_many :appointments
	has_many :availabilities
	validates_presence_of :name, :address, :postal_code, :city, :province, :type_id, :phone_number

end
