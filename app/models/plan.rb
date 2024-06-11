class Plan < ApplicationRecord
  belongs_to :user
  has_many :exercise_plans
  has_many :exercises, through: :exercise_plans

  def find
    ExercisePlan.where(plan: self)
  end
end
