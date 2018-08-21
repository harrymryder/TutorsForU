class UsersController < ApplicationController

  def index
    # ideally with `.where` with activerecord
    # @users = User.where
    @tutors = User.all.reject { |u| u.tutor? }
  end

  def show
    @tutor = User.find(params[:id])
  end

end
