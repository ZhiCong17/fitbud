if @tracker.persisted?
  json.tracker_form render(partial: "exercise_plans/form", formats: :html, locals: { tracker: Tracker.new, exercise_plan: @exercise_plan })
  json.inserted_item_tracker render(partial: "exercise_plans/tracker", formats: :html, locals: { tracker: @tracker, index: @exercise_plan.no_of_sets - 1 })
  json.inserted_item_exercise render(partial: "exercise_plans/exercise", formats: :html, locals: { exercise_plan: @exercise_plan })
  json.set @exercise_plan.no_of_sets
  # sets completed
  if @exercise_plan.complete_set?
    # json.inserted_item_exercise render(partial: "exercise_plans/exercise", formats: :html, locals: { exercise_plan: @exercise_plan })

    # jump to next exercise
    if @exercise_plan.next_exercise_plan.present?
      json.next_exercise "http://localhost:3000/plans/#{@exercise_plan.plan.id}/exercise_plans/#{@exercise_plan.next_exercise_plan.id}"
      json.status "nextExercise"
    # last exercise for the day
    else
      json.completion_message "<p class='text-success'>Congratulations! You have completed your exercise for the day.</p>"
      json.status "workoutComplete"
    end
  # continue to next set
  else
    # json.inserted_item_exercise render(partial: "exercise_plans/exercise", formats: :html, locals: { exercise_plan: @exercise_plan })
    json.status "continueExercise"
  end
# tracker form error
else
  json.tracker_form render(partial: "exercise_plans/form", formats: :html, locals: { tracker: @tracker, exercise_plan: @exercise_plan })
  json.status 'formError'
end
