class CreateTrackers < ActiveRecord::Migration[7.1]
  def change
    create_table :trackers do |t|
      t.integer :repetitions
      t.integer :weight
      t.references :exercise_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
