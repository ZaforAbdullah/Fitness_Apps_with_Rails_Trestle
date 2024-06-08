# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Create default users

load Rails.root.join('db', 'seeds', 'users.rb')
load Rails.root.join('db', 'seeds', 'goals.rb')
load Rails.root.join('db', 'seeds', 'profiles.rb')
load Rails.root.join('db', 'seeds', 'workouts.rb')
load Rails.root.join('db', 'seeds', 'nutrition_logs.rb')