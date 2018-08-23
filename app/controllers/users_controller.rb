class UsersController < ApplicationController

  def index
    # ideally with `.where` with activerecord
    # @users = User.where
    # @users = User.all
    @tutors = User.all.select { |u| u.tutor? }
  end

  def show
    # binding.pry÷
    @tutor = User.find(current_user[:id])
    @meetings = current_user.meetings_where_is_student
  end
end
