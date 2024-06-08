class Workout < ApplicationRecord
  belongs_to :user

  validates :exercise_type, :duration, :intensity, :calories_burned, presence: true
end
