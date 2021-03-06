class Client < ActiveRecord::Base
	belongs_to :user
	has_many :appointments, dependent: :destroy
	validates_presence_of :name, :address, :postal_code, :city, :province, :phone_number
end
