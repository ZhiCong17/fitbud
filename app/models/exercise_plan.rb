class ExercisePlan < ApplicationRecord
  belongs_to :plan

  has_many :exercises
end
