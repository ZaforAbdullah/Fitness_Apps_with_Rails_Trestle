class Profile < ApplicationRecord
  belongs_to :user
  # validates :weight, :height, :fitness_goal, presence: true
end
