class Tracker < ApplicationRecord
  belongs_to :exercise_plan

  validates :weight, :repetitions, presence: true
end
