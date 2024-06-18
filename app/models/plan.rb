class Plan < ApplicationRecord
  belongs_to :user
  has_many :exercise_plans
  has_many :exercises, through: :exercise_plans

  def find
    ExercisePlan.where(plan: self)
  end

  def progress_status
    complete_plans = 0
    rest_exercise_plans = exercise_plans.where('LOWER(description) = ?', 'rest day').count
    total_exercise_plans_by_day = exercise_plans.group_by(&:suggested_day)
    total_group_exercise_plans = (total_exercise_plans_by_day.count - rest_exercise_plans).to_f
    total_exercise_plans_by_day.each_value do |exercise_plan|
      if exercise_plan.all? { |exercise| exercise.status == "Complete" }
        complete_plans += 1
      end
    end
    (complete_plans / total_group_exercise_plans) * 100
  end

  def rest_day
    rest = ExercisePlan.find_by(status: "rest")
  end

  def self.check_and_handle_existing_plan(user)
    active_plan = Plan.where(user: user).where("progress < ?", 100).last
    if active_plan
       return { status: :existing, plan: active_plan }
    else
      plan = Plan.new
      workout_plan = plan.create_plan(user)
      new_plan = WorkoutPlanService.create_plan(user.id, workout_plan)
      if new_plan
        return { status: :created, plan: new_plan }
      end
    end
  end

  def create_plan(user)
    client = OpenAI::Client.new
    content = <<~PROMPT
      "Give me a 7 days gym workout plan for a beginner.
      The plan should be for a #{user.age} year #{user.gender}, #{user.weight}kg, #{user.height}cm, looking to #{user.fitness_goal}.
      Breakdown the plan in terms of days just present by integer like 1,2,3...(dont want show as day format).
      Each day could consist of own description (must not include day) and at least 5 exercises, each exercise can be broken down into one instance which include name, must have instructions (must be array), sets, reps or duration (in seconds), weight show float.
      If the exercise has sets must include a rest time, if not rest time the value must is 0. Key of rest time must as "rest_time".
      Without repeated day.
      Please include at least one rest day, must at day 4.
      For the Rest day must no has any exercises and the description must is "Rest day".
      Cardio is not consider is rest day.
      Format your output into a json response"
    PROMPT
    begin
      chaptgpt_response = client.chat(parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: }]
      })
      @content = chaptgpt_response["choices"][0]["message"]["content"]
      workout_plan = JSON.parse(@content)
    rescue JSON::ParserError => e
      puts "Error parsing JSON: #{e.message}"
      retry
    end
  end

end
