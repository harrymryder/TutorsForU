class MeetingsController < ApplicationController
  def new
    @meeting = Meeting.new
    @tutor = User.find(params[:user_id])
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @tutor = User.find(params[:user_id])
    @meeting.tutor = @tutor
    @meeting.student = current_user
    if @meeting.save
      redirect_to user_path(@tutor)
    else
      render :new
    end
  end

  # def index
  #   @meetings = Meeting.where
  # end

  private

  def meeting_params
    params.require(:meeting).permit(:location, :start_time, :subject_id, :tutor_id, :student_id)
  end
end
