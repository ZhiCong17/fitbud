class Plan < ApplicationRecord
  belongs_to :user
  has_many :exercise_plans

  def find
    ExercisePlan.where(plan: self)
  end
end
