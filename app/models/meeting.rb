class Meeting < ApplicationRecord
  belongs_to :subject
  belongs_to :student_id, dependent: :destroy
  belongs_to :tutor_id
end
