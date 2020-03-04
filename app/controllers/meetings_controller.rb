class MeetingsController < ApplicationController
  before_action :find_meeting, only: [:show, :create, :edit, :update, :destroy]

  def index
    @meetings = Meeting.all
  end

  def show
  end

  def new
    @meeting = Meeting.new
  end

  def create
    # @meeting = Meeting.new(validate_meeting)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_meeting
    @meeting = Meeting.find(params[:id])
  end

  def validate_meeting
    # params.require(:meeting).permit()
  end
end
