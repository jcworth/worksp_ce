class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :attendees
  has_many :meetings, through: :attendees
  has_many :hosted_meetings, class_name: "Meeting"
  # has_many :memberships
  # has_many :groups, through: :memberships

  attr_accessor :owner_id

end
