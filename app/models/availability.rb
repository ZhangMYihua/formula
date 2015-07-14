class Availability < ActiveRecord::Base
	belongs_to :teacher
  has_many :bookings

  def timerange
    TimeRange.new(start_time, end_time)
  end

  
end
