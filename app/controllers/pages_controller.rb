class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @meetings = Meeting.geocoded
    @markers = @meetings.map do |meeting|
      {
        lat: meeting.latitude,
        long: meeting.longitude
      }
    end
  end
end
