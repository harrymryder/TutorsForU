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
  end

  def show
    # binding.pry÷
    @tutor = User.find(params[:id])
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
      # Haversine Distance Calculation
    #
    # Accepts two coordinates in the form
    # of a tuple. I.e.
    #   geo_a  Array(Num, Num)
    #   geo_b  Array(Num, Num)
    #   miles  Boolean
    #
    # Returns the distance between these two
    # points in either miles or kilometers
    # Get latitude and longitude
    lat1, lon1 = geo_a
    lat2, lon2 = geo_b

    # Calculate radial arcs for latitude and longitude
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
end

