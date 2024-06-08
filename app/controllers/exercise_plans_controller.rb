class ExercisePlansController < ApplicationController
  def show
    @plan = Plan.find(params[:plan_id])
    @exercise_plan = ExercisePlan.find(params[:id])
    @tracker = Tracker.new
  end
end
