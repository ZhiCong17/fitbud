class WorkoutPlanService
  def self.create_plan(user_id, workout_plan)
    user = User.find(user_id)
    plan = Plan.create(
                        user: user,
                        progress: 0
                      )
    rest_day = Exercise.find_by(description: "Rest day")

    workout_plan.each do |days, details|
      order_num = 1
      description = details.first[1]
      # description = details["description"]
      exercises = details["exercises"]

        if exercises.nil?
          exercise_plan = ExercisePlan.create!(
            plan: plan,
            suggested_day: days,
            description: description,
            exercise: rest_day
          )
        else
          exercises.each do |exercise_details|
          current_exercise_storage = Exercise.find_by(title: exercise_details["name"])

          if current_exercise_storage.nil?
            video = YoutubeService::search_videos(exercise_details["name"])
            exercise = Exercise.create!(
              title: exercise_details["name"],
              description: exercise_details["instructions"], # If no description provided, set to an empty string
              exercise_plan_id: "",
              video: video
            )
            
            exercise_plan = ExercisePlan.create!(
              description: description,
              order: order_num,
              set: exercise_details["sets"],
              repetitions: exercise_details["reps"],
              suggested_day: days,
              weight: exercise_details["weight"] || 0.0, # If no weight provided, set to 0.0
              rest: exercise_details["rest"] || "", # If no rest provided, set to an empty string
              duration: exercise_details["duration"] || 0, # If no duration provided, set to 0
              exercise: exercise,
              plan: plan
              )
            order_num += 1

            exercise.update!(exercise_plan_id: exercise_plan.id)
          else
            exercise_plan = ExercisePlan.create!(
              description: description,
              order: order_num,
              set: exercise_details["sets"],
              repetitions: exercise_details["reps"],
              suggested_day: days,
              weight: exercise_details["weight"] || 0.0, # If no weight provided, set to 0.0
              rest: exercise_details["rest"] || "", # If no rest provided, set to an empty string
              duration: exercise_details["duration"] || 0, # If no duration provided, set to 0
              exercise: current_exercise_storage,
              plan: plan
              )
            order_num += 1
          end
        end
      end
    end
    plan
  end

  def self.set_image(exercise)
    client = OpenAI::Client.new
    prompt = <<~PROMPT
      An image of #{exercise}
      Subject should be focused in the center.
      Image should be in a realistic style.
      Backgound is dark color.

    PROMPT
    begin
      response = client.images.generate(parameters: {
        # model: "dall-e-2",
        prompt:, size: "256x256"
        # "1024x1024"
      })
      url = response["data"][0]["url"]
    rescue Faraday::TooManyRequestsError => e
      puts "Rate limit exceeded. Waiting for 5 seconds."
      sleep(5)
      retry
    end
  end
end
