class Exercise < ApplicationRecord
  has_many :exercise_plans
  has_many :plans, through: :exercise_plans

end
