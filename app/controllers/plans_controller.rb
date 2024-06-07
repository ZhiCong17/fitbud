class PlansController < ApplicationController
  def show
    plan = Plan.find(params[:id])
    @exercise_plans = plan.find
    @exercise_plans_by_day = @exercise_plans.group_by(&:suggested_day)
  end
end
