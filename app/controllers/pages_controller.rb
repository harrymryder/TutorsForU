class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def show
    @user = User.find(current_user[:id])
    @user_subject = UserSubject.new()
    @meetings = current_user.meetings_where_is_student
  end
end
