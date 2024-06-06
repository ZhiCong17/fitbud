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

puts "Creating plan..."
plan1 = Plan.create!(progress: 0, user: tom)
plan2 = Plan.create!(progress: 0, user: jane)

puts "Creating Exercise"
exercise1 = Exercise.create!(title: "Bodyweight Squats" , description: "bodyweight squat involves shifting your hips back" , video: "https://www.youtube.com/watch?v=8uoaYwS6iFM" )
exercise2 = Exercise.create!(title: "Push-ups ", description: "bodyweight squat involves shifting your hips back" , video: "https://www.youtube.com/watch?v=8uoaYwS6iFM" )
exercise3 = Exercise.create!(title: "Dumbbell Lunges", description: "bodyweight squat involves shifting your hips back" , video: "https://www.youtube.com/watch?v=8uoaYwS6iFM" )
exercise4 = Exercise.create!(title: "Dumbbell Rows", description: "bodyweight squat involves shifting your hips back" , video: "https://www.youtube.com/watch?v=8uoaYwS6iFM" )
exercise5 = Exercise.create!(title: "Plank", description: "bodyweight squat involves shifting your hips back" , video: "https://www.youtube.com/watch?v=8uoaYwS6iFM" )
exercise6 = Exercise.create!(title: "Cool down", description: "bodyweight squat involves shifting your hips back" , video: "https://www.youtube.com/watch?v=8uoaYwS6iFM" )

puts "Creating Exercise Plan..."
exercise_plan1 = ExercisePlan.create!(set: 3, repetitions: 20, suggested_day: 1, duration: 20, exercise: exercise1, plan: plan1)
exercise_plan2 = ExercisePlan.create!(set: 4, repetitions: 10, suggested_day: 1, duration: 20, exercise: exercise2, plan: plan1)
exercise_plan3 = ExercisePlan.create!(set: 2, repetitions: 10, suggested_day: 2, duration: 20, exercise: exercise3, plan: plan1)
exercise_plan4 = ExercisePlan.create!(set: 3, repetitions: 20, suggested_day: 1, duration: 20, exercise: exercise4, plan: plan2)
exercise_plan5 = ExercisePlan.create!(set: 2, repetitions: 10, suggested_day: 1, duration: 20, exercise: exercise5, plan: plan2)
exercise_plan6 = ExercisePlan.create!(set: 3, repetitions: 20, suggested_day: 2, duration: 20, exercise: exercise6, plan: plan2)


# puts "Creating Tracker"
