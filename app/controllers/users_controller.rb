class UsersController < ApplicationController

  def index
    # ideally with `.where` with activerecord
    # @users = User.where
    # @users = User.all
    @tutors = User.all.select { |u| u.tutor? }
  end

  def show
    # binding.pry÷
    @tutor = User.find(params[:id])
  end

end
