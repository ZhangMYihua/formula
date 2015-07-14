class Teacher < ActiveRecord::Base

	mount_uploader :avatar, AvatarUploader
	validates :first_name, :last_name, :price, :description, :country, :subject, :avatar, presence: true
	validates :price, numericality: { greater_than: 2 }
	# validates_presence_of :skype, :unless => lambda { self.home_phone.blank? }
	# validates_presence_of :qq, :unless => lambda { self.home_phone.blank? }
	#  validates :skype, presence: true, unless: ->(user){user.qq.present?}
	# validates :qq, presence: true, unless: ->(user){user.skype.present?}
	validates_presence_of :skype, :unless => :qq?
	validates_presence_of :qq, :unless => :skype?
end
