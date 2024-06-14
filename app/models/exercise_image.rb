class ExerciseImage < ApplicationRecord
  def self.find_url(exercise)
    existing_record = ExerciseImage.find_by(description: exercise)
    return existing_record.image_url if existing_record
  end
end
