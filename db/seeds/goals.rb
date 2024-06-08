require 'date'
require 'faker'

ActiveRecord::Base.transaction do
  5.times do |i|
    goal = Goal.create!(
      goal_type: "Goal type #{i + 1} by User 2",
      description: Faker::Lorem.sentence(word_count: 10),
      target_value: rand(1.0..100.0).round(2),
      current_value: rand(0.0..100.0).round(2),
      achieved: [true, false].sample,
      target_date: Date.today + rand(30..365),
      user_id: 1
    )

    # Simulating progress data for the chart
    progress_data = {}
    5.times do |j|
      date = (Date.today - (5 - j).days).strftime("%Y-%m-%d")
      progress_data[date] = rand(0.0..goal.target_value).round(2)
    end

    goal.update!(progress: progress_data)
  end
end


5.times do |i|
  goal = Goal.create(
    goal_type: "Goal type #{i + 1} by User 2",
    description: Faker::Lorem.sentence(word_count: 10),
    target_value: rand(1.0..100.0).round(2),
    current_value: rand(0.0..100.0).round(2),
    achieved: [true, false].sample,
    target_date: Date.today + rand(30..365),
    user_id: 2
  )

  # Simulating progress data for the chart
  progress_data = {}
  5.times do |j|
    date = (Date.today - (5 - j).days).strftime("%Y-%m-%d")
    progress_data[date] = rand(0.0..goal.target_value).round(2)
  end

  goal.update(progress: progress_data)
end