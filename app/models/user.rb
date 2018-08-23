class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_subjects
  has_many :subjects, through: :user_subjects
  has_many :meetings_where_is_student, class_name: 'Meeting', primary_key: 'id', foreign_key: 'student_id'
  has_many :meetings_where_is_tutor, class_name: 'Meeting', primary_key: 'id', foreign_key: 'tutor_id'


  geocoded_by :location
  after_validation :geocode #, if: :will_save_change_to_address?

  mount_uploader :photo, PhotoUploader


  def tutor?
    self.subjects.any?
  end

  def student?
    !tutor?
  end
end
