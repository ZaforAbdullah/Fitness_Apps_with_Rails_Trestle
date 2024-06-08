class NutritionLog < ApplicationRecord
  belongs_to :user

  validates :meal_type, :description, :calories, :date, presence: true
end
