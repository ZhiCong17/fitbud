class AddExercisePlanRefToExercises < ActiveRecord::Migration[7.1]
  def change
    add_reference :exercises, :exercise_plan, foreign_key: true
  end
end
