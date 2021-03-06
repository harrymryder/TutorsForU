class UserSubjectsController < ApplicationController

  # def tutors
  #   @tutors = UserSubjects.all.map { |user_subject| user_subject.user }
  # end
  def new
    @user_subject = UserSubject.new
    @user = User.find(params[:user_id])
  end

  def create
    @user_subject = UserSubject.new(user_subject_params)
    @user = User.find(params[:user_id])
    @user_subject.user = @user
    @user_subject.save
    redirect_to page_path(@user)
  end

  def destroy
    @user = User.find(params[:user_id])
    @user_subject = UserSubject.find(params[:user_id])
    @user_subject.destroy
    redirect_to page_path(@user)
  end

  private

  def user_subject_params
    params.require(:user_subject).permit(:user_id, :subject_id)
  end
end
