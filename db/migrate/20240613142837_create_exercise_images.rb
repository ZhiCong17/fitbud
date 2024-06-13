class CreateExerciseImages < ActiveRecord::Migration[7.1]
  def change
    create_table :exercise_images do |t|
      t.string :description
      t.string :image_url

      t.timestamps
    end
  end
end
