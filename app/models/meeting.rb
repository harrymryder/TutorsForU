class Meeting < ApplicationRecord
  belongs_to :student, class_name: 'User', foreign_key: 'student_id'
  belongs_to :tutor, class_name: 'User', foreign_key: 'tutor_id'
  belongs_to :subject
  validates :location, presence: true
  validates :start_time, presence: true
  # validates :student_id, uniqueness: { scope: :tutor_id }


  def index
    @meetings = Meeting.all
  end

end
