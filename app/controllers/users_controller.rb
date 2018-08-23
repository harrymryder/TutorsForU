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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to page_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :photo)
  end
end
