class ExercisePlan < ApplicationRecord
  belongs_to :plan
  belongs_to :exercise
  has_many :trackers

  def complete!
    self.update!(status: "Complete")
  end

  def complete_set?
    set == trackers.count
  end

  def next_exercise_plan
    ExercisePlan.find_by(plan_id: self.plan.id, order: self.order + 1)
  end

  def no_of_sets
    trackers.count
  end
end
