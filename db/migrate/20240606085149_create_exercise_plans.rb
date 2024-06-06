class CreateExercisePlans < ActiveRecord::Migration[7.1]
  def change
    create_table :exercise_plans do |t|
      t.integer :set
      t.integer :repetitions
      t.integer :suggested_day
      t.integer :duration
      t.references :exercise, null: false, foreign_key: true
      t.references :plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
