class WorkoutPlanService
  def self.create_plan(user_id, workout_plan)
    user = User.find(user_id)
    plan = Plan.create(user_id: user.id)



    workout_plan.each do |days, details|
    order_num = 1
      details.each do |detail|
        description = detail.second
        exercises = details["exercises"]

      if exercises.nil?

      else
      exercises.each do |exercise_details|
        exercise = Exercise.create(
          title: exercise_details["name"],
          description: "", # If no description provided, set to an empty string
          exercise_plan_id: ""
        )
        exercise_plan = ExercisePlan.create(
          description: description,
          order: order_num,
          set: exercise_details["sets"],
          repetitions: exercise_details["reps"],
          suggested_day: days,
          weight: exercise_details["weight"] || 0.0, # If no weight provided, set to 0.0
          rest: exercise_details["rest"] || "", # If no rest provided, set to an empty string
          duration: exercise_details["duration"] || 0, # If no duration provided, set to 0
          exercise_id: exercise.id,
          plan_id: plan.id,
          )
        order_num += 1

        exercise.update!(exercise_plan_id: exercise_plan.id)
      end
    end
    end
    end

    plan
  end
end
