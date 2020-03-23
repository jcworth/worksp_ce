class AttendeesController < ApplicationController

  def new
    @attendee = Attendee.new
    @meeting = Meeting.find(params[:meeting_id])
  end

  def create
    @attendee = Attendee.find(params[:id])
    @attendee.user = current_user
    @attendee.confirmed = true
    # @Attendee.meeting = @meeting
  end

  def edit
  end

  def update
  end

  private


end
