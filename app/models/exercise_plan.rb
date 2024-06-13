class ExercisePlan < ApplicationRecord
  belongs_to :plan
  belongs_to :exercise
  has_many :trackers

  def complete_set?
    set == trackers.count
  end

  def next_exercise_plan
    ExercisePlan.find_by(plan_id: plan.id, order: order + 1)
  end

  def no_of_sets
    trackers.count
  end

  def cardio_exercise?
    duration.positive? && set == nil
  end

  def duration_exercise?
    duration.positive? && set > 1
  end
end
