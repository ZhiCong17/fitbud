class AddFieldsToExercisePlans < ActiveRecord::Migration[7.1]
  def change
    add_column :exercise_plans, :status, :string
    add_column :exercise_plans, :order, :integer
    add_column :exercise_plans, :description, :string
  end
end
