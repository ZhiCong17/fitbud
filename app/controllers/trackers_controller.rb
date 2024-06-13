class TrackersController < ApplicationController
  def create
    @tracker = Tracker.new(tracker_params)
    @exercise_plan = ExercisePlan.find(params[:exercise_plan_id])
    @tracker.exercise_plan = @exercise_plan

    respond_to do |format|
      if @tracker.save
        format.json
      else
        format.json
      end
    end
  end

  private

  def tracker_params
    params.require(:tracker).permit(:weight, :repetitions)
  end
end
