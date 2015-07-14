class Availability < ActiveRecord::Base
	belongs_to :teacher
  has_many :bookings
  
  
end
