class Plan < ApplicationRecord
  belongs_to :user
  has_many :exercise_plans
  has_many :exercises, through: :exercise_plans

  def find
    ExercisePlan.where(plan: self)
  end

  def progress_status
    total_exercise_plans = (self.exercise_plans.count).to_f
    completed_exercise_plans = (self.exercise_plans.where(status: "Complete").count).to_f
    progress = ((completed_exercise_plans / total_exercise_plans).to_f) * 100
  end

  def create_plan(user)
    client = OpenAI::Client.new
    content = <<~PROMPT
      "Give me a 1 week gym workout plan for a beginner.
      The plan should be for a #{user.age} year #{user.gender}, #{user.weight}kg, #{user.height}cm, looking to #{user.fitness_goal}.
      Breakdown the plan in terms of days just present by integer like 1,2,3...(dont want show as day format).
      Each day could consist of own description (must not include day )and at least 5 exercises, each exercise can be broken down into one instance which are include name, must have instructions (must be array), sets, reps, weight show float, and/or duration show second. If the exercise requires, you can include a rest time.
      For the Rest day must no has any exercises.
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
