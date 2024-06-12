# json.form "testtest"
# json.some_key @test

# json.parent do
#   json.first_child [1,2,3]
#   json.second_child "hello"
# end

if @tracker.persisted?
  json.success true
  json.form render(partial: "exercise_plans/form", formats: :html, locals: { tracker: Tracker.new, exercise_plan: @exercise_plan })
  json.inserted_item render(partial: "exercise_plans/tracker", formats: :html, locals: { tracker: @tracker })
else
  json.success false
  json.form render(partial: "exercise_plans/form", formats: :html, locals: { tracker: @tracker, exercise_plan: @exercise_plan })
end
