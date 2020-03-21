class MeetingsController < ApplicationController
  before_action :find_meeting, only: [:show, :edit, :update, :destroy]

  def index
    @meetings = Meeting.all
  end

  def show
    attendance = @meeting.attendees.where(host:'true').reduce
    @host = attendance.user
  end

  def new
    @meeting = Meeting.new
    # @attendee = Attendee.new
  end

  def create
    @meeting = Meeting.new(validate_meeting)
    @attendee = Attendee.new
    @attendee.meeting = @meeting
    @attendee.user = current_user
    @attendee.host = true
    @attendee.save!
    if @meeting.save
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
    params.require(:meeting).permit(:description, :date, :location)
  end
end
