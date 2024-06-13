class ExercisePlansController < ApplicationController
  def show
    # @plan can be commented out because belong to plan make it already have access to plan's details
    @plan = Plan.find(params[:plan_id])
    @exercise_plan = ExercisePlan.find(params[:id])
    @tracker = Tracker.new
    # @disabled_tracker = @exercise_plan.complete_set?

    # show different page layout if exercise is duration based
    if @exercise_plan.cardio_exercise?
      render :cardio_exercise
    elsif @exercise_plan.duration_exercise?
      render :duration_exercise
    else
      render :show
    end
  end
end
