class AttendeesController < ApplicationController

  def new
    @attendee = Attendee.new
    @meeting = Meeting.find(params[:meeting_id])
  end

  def create
    @Attendee = Attendee.find(params[:id])
    @Attendee.user = current_user
    # @Attendee.meeting = @meeting
  end

  def edit
  end

  def update
  end

  private


end
