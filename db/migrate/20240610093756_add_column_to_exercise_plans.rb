class AddColumnToExercisePlans < ActiveRecord::Migration[7.1]
  def change
    add_column :exercise_plans, :rest, :float
    add_column :exercise_plans, :weight, :float
  end
end
