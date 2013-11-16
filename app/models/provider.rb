class Provider < ActiveRecord::Base
	has_one :user
	belongs_to :type
	validates_presence_of :name, :address, :postal_code, :city, :province, :type_id, :phone_number

end
