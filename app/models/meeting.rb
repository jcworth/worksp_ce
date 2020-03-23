class Meeting < ApplicationRecord
  has_many :attendees, dependent: :destroy
  has_many :users, through: :attendees
  belongs_to :owner, class_name: "User"
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
