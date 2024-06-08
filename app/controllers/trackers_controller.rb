class TrackersController < ApplicationController
  def create
    @tracker = Tracker.new(tracker_params)
    exercise_plan = ExercisePlan.find(params[:exercise_plan_id])
    @tracker.exercise_plan = exercise_plan

    if @tracker.save
      redirect_to plan_exercise_plan_path(exercise_plan.plan, exercise_plan)
    else
      redirect_to plan_exercise_plan_path(exercise_plan.plan, exercise_plan), alert: "Inputs cannot be empty"
    end
  end

  private

  def tracker_params
    params.require(:tracker).permit(:weight, :repetitions)
  end
end
