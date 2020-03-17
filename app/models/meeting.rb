class Meeting < ApplicationRecord
  has_many :attendees, dependent: :destroy
  has_many :users, through: :attendees
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
