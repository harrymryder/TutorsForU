class Subject < ApplicationRecord
  has_many :meetings
  has_many :user_subjects
  has_many :tutor_id, through: :user_subjects
end
