class Plan < ApplicationRecord
  belongs_to :user
  has_many :exercise_plans
  has_many :exercises, through: :exercise_plans

  def find
    ExercisePlan.where(plan: self)
  end

  def create_plan(user)
    client = OpenAI::Client.new
    begin
      chaptgpt_response = client.chat(parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: "Give me a 1 week gym workout plan for a beginner. The plan should be for a #{user.age} year #{user.gender}, #{user.weight}kg, #{user.height}cm, looking to #{user.fitness_goal}. breakdown the plan in terms of days just present by integer like 1,2,3....(dont want show as day format). Each day could consist of own description and multiple exercises, each exercise can be broken down into one instance which are include name, short description, sets, reps, weight show float, and/or duration. if the exercise requires, you can include a rest time. format your output into a json response"}]
      })
      @content = chaptgpt_response["choices"][0]["message"]["content"]
      workout_plan = JSON.parse(@content)
    rescue JSON::ParserError => e
      puts "Error parsing JSON: #{e.message}"
      retry
    end
  end
end
