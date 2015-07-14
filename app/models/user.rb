class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	validates :username, presence: true
	validates :time_zone, presence: true
	has_one :teacher, dependent: :destroy
  has_many :bookings, foreign_key: :student_id
  has_many :reviews, dependent: :destroy
  
end
