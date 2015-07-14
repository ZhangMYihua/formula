class Booking < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :student, class_name: 'User'
  belongs_to :availability
end
