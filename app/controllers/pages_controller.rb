class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @meetings = Meeting.geocoded
    @markers = @meetings.map do |meeting|
      data = Geocoder.search("#{meeting.google_place_id}", lookup: :google, google_place_id: true)
      {
        lat: data[0].geometry['location']['lat'],
        lng: data[0].geometry['location']['lng'],
        infoWindow: {
          content: render_to_string(partial: "info_window", locals: { meeting: meeting })
        }
        # infoWindow: render_to_string(partial: "info_window", locals: { meeting: meeting })
      }
    end
  end

  def dashboard
    # @hosted_meetings = current_user.hosted_meetings
    @requests = Attendee.joins(:meeting).where(meetings: {owner_id: current_user})
  end
end

# requests = Attendee.joins(:meeting).where(meetings: {owner_id: 2})
# @requests = Attendee.joins(:meeting).where(meetings: {owner_id: @user})


# Attendee.where.not(user_id: current_user).where(confirmed: false)
# Attendee.joins(meetings: { owner: current_user }

