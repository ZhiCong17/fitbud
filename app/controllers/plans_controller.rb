require 'json'

class PlansController < ApplicationController

  def index
  end

  def show
    plan = Plan.find(params[:id])
    @exercise_plans = plan.find
    @exercise_plans_by_day = @exercise_plans.group_by(&:suggested_day)
  end

  def create
    user = current_user
    plan = Plan.new()
    workout_plan = plan.create(user)
    if plan = WorkoutPlanService.create_plan(user.id, workout_plan)
      redirect_to plan_path(plan), alert: "New Workout plan created"
    end
  end

  def plans_history
    @user = current_user
    @completed_plans = Plan.where(user_id: @user.id, progress: 100).order(created_at: :desc)
    # @completed_plans.each do |plan|
    #   @exercise_plan = plan
  end
end
