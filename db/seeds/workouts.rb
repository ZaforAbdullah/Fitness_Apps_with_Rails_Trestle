# 5.times do |i|
#   Workout.create(
#     exercise_type: "Workout #{i + 1} by User 2",
#     duration: rand(30...60),
#     intensity: 1,
#     calories_burned: rand(150...350),
#     user_id: 1
#   )
# end

Workout.create!(
  exercise_type: "cardio",
  duration: 30,
  intensity: 4,
  calories_burned: 300,
  user_id: 1
)

Workout.create!(
  exercise_type: "strength",
  duration: 45,
  intensity: 4,
  calories_burned: 400,
  user_id: 1
)

Workout.create!(
  exercise_type: "cardio",
  duration: 24,
  intensity: 4,
  calories_burned: 250,
  user_id: 1
)

5.times do |i|
  Workout.create(
    exercise_type: "Workout #{i + 1} by User 3",
    duration: rand(30...60),
    intensity: 1,
    calories_burned: rand(150...350),
    user_id: 2
  )
end
