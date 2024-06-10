class TrackersController < ApplicationController
  def create
    @tracker = Tracker.new(tracker_params)
    @exercise_plan = ExercisePlan.find(params[:exercise_plan_id])
    @next_exercise_plan = ExercisePlan.find(params[:exercise_plan_id].to_i + 1)
    @tracker.exercise_plan = @exercise_plan

    if @tracker.save
      if @exercise_plan.complete_set?
        # need to redirect to next exercise
        redirect_to plan_exercise_plan_path(@exercise_plan.plan, @next_exercise_plan)
      else
        redirect_to plan_exercise_plan_path(@exercise_plan.plan, @exercise_plan)
      end
    else
      render 'exercise_plans/show', status: :unprocessable_entity
    end
  end

  private

  def tracker_params
    params.require(:tracker).permit(:weight, :repetitions)
  end
end
