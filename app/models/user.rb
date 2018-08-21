class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_subjects
  has_many :subjects, through: :user_subjects
  has_many :meetings

  def tutor?
    self.subjects.any?
  end

  def student?
    !tutor?
  end
end
