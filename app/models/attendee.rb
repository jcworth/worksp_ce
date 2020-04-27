class Attendee < ApplicationRecord
  belongs_to :user
  belongs_to :meeting

  scope :confirmed, -> { where(confirmed: true) }
  scope :awaiting, -> { where(confirmed: false) }
  scope :declined, -> { where(declined: true) }


end
