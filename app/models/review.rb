class Review < ActiveRecord::Base
  belongs_to :student, class_name: 'User'
  belongs_to :teacher

  validates :rating, :comment, presence: true
end
