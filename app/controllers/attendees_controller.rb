class AttendeesController < ApplicationController
  before_action :find_attendee, only: [:edit, :update]

  def new
    @attendee = Attendee.new
    @meeting = Meeting.find(params[:meeting_id])
    respond_to { |format| format.js }
    authorize @attendee
  end

  def create
    @attendee = Attendee.new(validate_attendee)
    meeting = Meeting.find(params[:meeting_id])
    @attendee.user = current_user
    @attendee.meeting = meeting
    authorize @attendee
    if @attendee.save!
      redirect_to meeting_path(meeting)
    else
      render :new
    end
    # @attendee.confirmed = true
    # @Attendee.meeting = @meeting
  end

  def edit; end

  def update
    @attendee.update(validate_attendee)
    # redirect_to meeting_path(@meeting)
    authorize @attendee
  end

  private

  def find_attendee
    @attendee = Attendee.find(params[:id])
    # authorize @attendee
  end

  def validate_attendee
    params.require(:attendee).permit(:message, :confirmed)
  end


end
