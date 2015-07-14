class Teacher < ActiveRecord::Base

	mount_uploader :avatar, AvatarUploader
	validates :first_name, :last_name, :price, :description, :country, :subject, :avatar, presence: true
	validates :price, numericality: { greater_than: 2 }
	validates_presence_of :skype, :unless => :qq?
	validates_presence_of :qq, :unless => :skype?
	belongs_to :user
	has_many :availabilities, dependent: :destroy
  has_many :bookings 
  has_many :users, through: :bookings
  has_many :interviews

  def availability_open?(requested_availability)
    new_availability = requested_availability.timerange    

    no_other_availabilities = self.availabilities.reload.none? do |availability|
      availability.timerange.overlap?(new_availability)
    end

    no_other_availabilities
  end

  def bookable?(requested_booking)
    new_booking = requested_booking.timerange

    no_double_booking = self.bookings.reload.none? do |booking|
      booking.timerange.overlap?(new_booking)
    end
    
    available_booking = self.availabilities.any? do |availability|
      availability.timerange.in_range?(new_booking)
    end 
    no_double_booking && available_booking
  end


end
