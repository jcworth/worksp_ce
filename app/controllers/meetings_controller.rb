class MeetingsController < ApplicationController
  before_action :find_meeting, only: [:show, :edit, :update, :destroy]

  def index
    @meetings = Meeting.all
  end

  def show
    # data = Geocoder.search("#{@meeting.google_place_id}", lookup: :google, google_place_id: true)
    # @marker = [{
    #   lat: data[0].geometry['location']['lat'],
    #   lng: data[0].geometry['location']['lng']
    # }]
    attendance = @meeting.attendees.reduce

  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.create(validate_meeting)
    @meeting.owner = current_user
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
    params.require(:meeting).permit(:title, :description, :date, :location, :google_place_id)
  end
end
