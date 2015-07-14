class Availability < ActiveRecord::Base
	belongs_to :teacher
  has_many :bookings

  validate :consistent


  def timerange
    TimeRange.new(start_time, end_time)
  end

private
  def consistent
    unless teacher.availability_open?(self)
      errors.add(:availability, "cannot be made for that time")
    end

    if start_time >= end_time
      errors.add(:start_time, "cannot be greater than the end time")
    elsif start_time < Time.now
      errors.add(:start_time, "cannot be earlier than the current time")
    end
  end
  
end
