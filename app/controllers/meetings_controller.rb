class MeetingsController < ApplicationController
  def new
    @meeting = Meeting.new
  end

  def create
    meeting = Meeting.new(meeting_params)
    tutor = User.find(params[:tutor_id])
    meeting.tutor_id = tutor
    if meeting.save
      redirect_to
    else
      render :new
    end
  end

  def show
    @
  end

  private

  def meeting_params
    params.require(:meeting).permit(:location, :date, :subject_id, :tutor_id, :student_id)
  end
end
