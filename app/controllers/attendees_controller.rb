class AttendeesController < ApplicationController
  before_action :find_attendee, only: [:edit, :update, :destroy]

  def new
    @attendee = Attendee.new
    @meeting = Meeting.find(params[:meeting_id])
    authorize @attendee
    respond_to do |format|
      format.js
    end
  end

  def create
    @attendee = Attendee.new(validate_attendee)
    meeting = Meeting.find(params[:meeting_id])
    @attendee.user = current_user
    @attendee.meeting = meeting
    authorize @attendee
    if @attendee.save!
      respond_to do |format|
        format.js { flash.now[:notice] = 'Request sent!' }
      end
    else
      render :new
    end
  end

  def edit; end

  def update
    @received_requests = Attendee.joins(:meeting).where(meetings: {owner_id: current_user}, attendees: {confirmed: false, declined: false})
    @pending_requests = current_user.attendees
    if @attendee.update(validate_attendee)
      authorize @attendee
      respond_to do |format|
        format.js { flash.now[:notice] = 'Response sent!' }
      end
    end
  end

  def destroy
    authorize @attendee
    @attendee.destroy
  end

  private

  def find_attendee
    @attendee = Attendee.find(params[:id])
    authorize @attendee
  end

  def validate_attendee
    params.require(:attendee).permit(:message, :confirmed, :declined)
  end


end
