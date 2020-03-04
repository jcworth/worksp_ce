class Meeting < ApplicationRecord
  has_many :attendees
  has_many :users, through: :attendees
end
