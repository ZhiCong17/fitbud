class TrackersController < ApplicationController
  def create
    @tracker = Tracker.new(tracker_params)
    exercise_plan = ExercisePlan.find(params[:exercise_plan_id])
    @tracker.exercise_plan = exercise_plan

    if @tracker.save
      redirect_to plan_exercise_plan_path(exercise_plan.plan, exercise_plan)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def tracker_params
    params.require(:tracker).permit(:weight, :repetitions)
  end
end
