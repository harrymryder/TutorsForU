class UsersController < ApplicationController

  def index
    if params[:subject].present? && params[:location].present?
      @tutors = test_subjects_match
      @tutors = geocode_proximity(@tutors)
    elsif params[:subject].present?
      @tutors = test_subjects_match
    elsif params[:location].present?
      @tutors = User.all.select { |u| u.tutor? }
      @tutors = geocode_proximity(@tutors)
    else
      @tutors = User.all.select { |u| u.tutor?}
    end
    @query_location = Geocoder.search(params[:location]).first.coordinates
  end

  def show
    # binding.pry÷
    @tutor = User.find(current_user[:id])
    @meetings = current_user.meetings_where_is_student
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

  def test_subjects_match
    @tutors = User.all.select { |u| u.tutor? }
      better_tutors = []
      @tutors.each do |tutor|
        subject = UserSubject.find_by(user_id: tutor.id).subject_id
        subject = Subject.find(subject).name
        if subject == params[:subject]
          better_tutors << tutor
        end
      end
      return better_tutors
  end

  def geocode_proximity(tutors)
    location_latlong = Geocoder.search(params[:location])
    better_tutors = []
    tutors.each do |tutor|
      if haversine_distance(location_latlong.first.coordinates, [tutor.latitude, tutor.longitude]) <= 20
        better_tutors << tutor
      end
    end
  end


  def haversine_distance(geo_a, geo_b, miles=true)
    lat1, lon1 = geo_a
    lat2, lon2 = geo_b
    dLat = (lat2 - lat1) * Math::PI / 180
    dLon = (lon2 - lon1) * Math::PI / 180
    a = Math.sin(dLat / 2) *
        Math.sin(dLat / 2) +
        Math.cos(lat1 * Math::PI / 180) *
        Math.cos(lat2 * Math::PI / 180) *
        Math.sin(dLon / 2) * Math.sin(dLon / 2)
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
    d = 6371 * c * (miles ? 1 / 1.6 : 1)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :photo)
  end
end


