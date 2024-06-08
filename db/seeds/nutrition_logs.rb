require 'date'
require 'faker'

5.times do |i|
  NutritionLog.create(
    meal_type: "meal type #{i + 1} by User 2",
    description: Faker::Food.description,
    calories: rand(50...100),
    date: Date.today,
    user_id: 1
  )
end

5.times do |i|
  NutritionLog.create(
    meal_type: "meal type #{i + 1} by User 3",
    description: Faker::Food.description,
    calories: rand(50...100),
    date: Date.today,
    user_id: 2
  )
end