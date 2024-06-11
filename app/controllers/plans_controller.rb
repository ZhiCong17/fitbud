require 'json'

class PlansController < ApplicationController
  def show
    plan = Plan.find(params[:id])
    @exercise_plans = plan.find
    @exercise_plans_by_day = @exercise_plans.group_by(&:suggested_day)
  end

  def new
    user = current_user
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "Give me a 1 week gym workout plan for a beginner. The plan should be for a #{user.age} year #{user.gender}, #{user.weight}kg, #{user.height}cm, looking to #{user.fitness_goal}. breakdown the plan in terms of days just present by integer like 1,2,3....(dont want show as day format). Each day could consist of own description and multiple exercises, each exercise can be broken down into one instance which are include name, sets, reps, weight show float, and/or duration. if the exercise requires, you can include a rest time. format your output into a json response"}]
    })
    @content = chaptgpt_response["choices"][0]["message"]["content"]
    workout_plan = JSON.parse(@content)

    if plan = WorkoutPlanService.create_plan(user.id, workout_plan)
      redirect_to plan_path(plan.id), alert: "New Workout plan created"
    end
  end

end
