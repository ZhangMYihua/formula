class Booking < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :student, class_name: 'User'
  belongs_to :availability
  validates :start_time, :end_time, presence: :true
  validate :consistent

  def timerange
    TimeRange.new(start_time, end_time)
  end

private
  def consistent
    unless teacher.bookable?(self)
      errors.add(:teacher, "is unavailable at that time.")
    end

    if start_time >= end_time
      errors.add(:start_time, "cannot be greater than the end time")
    elsif start_time < Time.now
      errors.add(:start_time, "cannot be earlier than the current time")
    end
  end
end
