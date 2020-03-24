class MeetingsController < ApplicationController
  before_action :find_meeting, only: [:show, :edit, :update, :destroy]

  def index
    @meetings = Meeting.all
  end

  def show
    @marker = [{
      lat: @meeting.latitude,
      long: @meeting.longitude
    }]
    attendance = @meeting.attendees.reduce
    # @host = attendance.user
    # raise
  end

  def new
    @meeting = Meeting.new
    # @attendee = Attendee.new
  end

  def create
    @meeting = Meeting.create(validate_meeting)
    @meeting.owner = current_user
    # @attendee = Attendee.new
    # @attendee.meeting = @meeting
    # @attendee.user = current_user
    # @attendee.host = true
    # @attendee.save!
    if @meeting.save!
      flash[:success] = "Meeting created!"
      redirect_to meetings_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @meeting.update(validate_meeting)
    redirect_to meeting_path(@meeting)
  end

  def destroy
    @meeting.destroy
    redirect_to meetings_path
  end

  private

  def find_meeting
    @meeting = Meeting.find(params[:id])
  end

  def validate_meeting
    params.require(:meeting).permit(:title, :description, :date, :location)
  end
end
