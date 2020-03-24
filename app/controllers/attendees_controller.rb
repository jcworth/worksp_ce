class AttendeesController < ApplicationController

  def new
    @attendee = Attendee.new
    # @meeting = Meeting.find(params[:meeting_id])
  end

  def create
    @attendee = Attendee.new(validate_attendee)
    meeting = Meeting.find(params[:meeting_id])
    @attendee.user = current_user
    @attendee.meeting = meeting
    if @attendee.save!
      redirect_to meeting_path(meeting)
    else
      render :new
    end
    # @attendee.confirmed = true
    # @Attendee.meeting = @meeting
  end

  def edit
  end

  def update
  end

  private

  def validate_attendee
    params.require(:attendee).permit(:message)
  end


end
