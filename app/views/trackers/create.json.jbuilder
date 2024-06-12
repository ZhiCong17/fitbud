# json.form "testtest"
# json.some_key @test

# json.parent do
#   json.first_child [1,2,3]
#   json.second_child "hello"
# end

# if @tracker.persisted?
#   json.success true

#   if @exercise_plan.complete_set?
#     json.next_url @exercise_plan.next_exercise_plan.location.href

#   else
#     json.form render(partial: "exercise_plans/form", formats: :html, locals: { tracker: Tracker.new, exercise_plan: @exercise_plan })
#     json.inserted_item_tracker render(partial: "exercise_plans/tracker", formats: :html, locals: { tracker: @tracker, index: @exercise_plan.no_of_sets - 1 })
#     json.inserted_item_exercise render(partial: "exercise_plans/exercise", formats: :html, locals: { exercise_plan: @exercise_plan })
#   end
# else
#   json.success false
#   json.form render(partial: "exercise_plans/form", formats: :html, locals: { tracker: @tracker, exercise_plan: @exercise_plan }, status: :unprocessable_entity)
# end

if @tracker.persisted?
  if @exercise_plan.complete_set?
    if @exercise_plan.next_exercise_plan.present?
      json.next_exercise "http://localhost:3000/plans/#{@exercise_plan.plan.id}/exercise_plans/#{@exercise_plan.next_exercise_plan.id}"
      json.status "nextExercise"
    else
      json.tracker_form render(partial: "exercise_plans/form", formats: :html, locals: { tracker: Tracker.new, exercise_plan: @exercise_plan })
      json.inserted_item_tracker render(partial: "exercise_plans/tracker", formats: :html, locals: { tracker: @tracker, index: @exercise_plan.no_of_sets - 1 })
      json.inserted_item_exercise render(partial: "exercise_plans/exercise", formats: :html, locals: { exercise_plan: @exercise_plan })
      json.completion_message "<p class='text-success'>Congratulations! You have completed your exercise for the day.</p>"
      json.status "workoutComplete"
    end
  else
    json.tracker_form render(partial: "exercise_plans/form", formats: :html, locals: { tracker: Tracker.new, exercise_plan: @exercise_plan })
    json.inserted_item_tracker render(partial: "exercise_plans/tracker", formats: :html, locals: { tracker: @tracker, index: @exercise_plan.no_of_sets - 1 })
    json.inserted_item_exercise render(partial: "exercise_plans/exercise", formats: :html, locals: { exercise_plan: @exercise_plan })
    json.status "continueExercise"
  end
else
  json.tracker_form render(partial: "exercise_plans/form", formats: :html, locals: { tracker: @tracker, exercise_plan: @exercise_plan })
  json.status 'formError'
end
