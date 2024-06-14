# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database..."
ExercisePlan.destroy_all
Exercise.destroy_all
Plan.destroy_all
User.destroy_all

puts "Creating user..."
tom = User.create!(email: "tom@gmail.com", password: "password", username: "tom", gender: "male", height: 170, weight: 58, age: 29, fitness_goal: "gain muscle" )
jane = User.create!(email: "jane@gmail.com", password: "password", username: "jane", gender: "female", height: 162, weight: 39, age: 21, fitness_goal: "lose weight" )

puts "Creating Exercise"
exercise7 = Exercise.create!(title: "", description: "Rest day", video: "" )
