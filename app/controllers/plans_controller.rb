require 'json'

class PlansController < ApplicationController
  def show
    plan = Plan.find(params[:id])
    @exercise_plans = plan.find
    @exercise_plans_by_day = @exercise_plans.group_by(&:suggested_day)
  end

  def create
    user = current_user
    plan = Plan.new()
    workout_plan = plan.create_plan(user)
    if plan = WorkoutPlanService.create_plan(user.id, workout_plan)
      redirect_to plan_path(plan), alert: "New Workout plan created"
    end
  end
end
