class UsersController < ApplicationController

  def index
    # geocode params location
    if params[:subject].present?
      @tutors = User.all.select { |u| u.tutor? }
      @better_tutors = []
      @tutors.each do |tutor|
        subject = UserSubject.find_by(user_id: tutor.id).subject_id
        subject = Subject.find(subject).name
        if subject == params[:subject]
          @better_tutors << tutor
        end
      end
      @tutors = @better_tutors
      #compare user lat and long to params lat and long}
    else
      @tutors = User.all.select { |u| u.tutor?}
    end
  end

  def show
    # binding.pry÷
    @tutor = User.find(params[:id])
  end

end

