class MeetingsController < ApplicationController
  before_action :find_meeting, only: [:show, :edit, :update, :destroy]

  def index
    @meetings = Meeting.all
  end

  def show; end

  def new
    @meeting = Meeting.new
    # @attendee = Attendee.new
  end

  def create
    @meeting = Meeting.new(validate_meeting)
    @attendee = Attendee.new
    @attendee.meeting = @meeting
    @attendee.user = current_user
    @attendee.save
    if @meeting.save
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
    params.require(:meeting).permit(:date, :location)
  end
end
