class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @meetings = Meeting.geocoded
    @markers = @meetings.map do |meeting|
      {
        lat: meeting.latitude,
        long: meeting.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { meeting: meeting })
      }
    end
  end

  def dashboard
    @user = current_user
  end
end
