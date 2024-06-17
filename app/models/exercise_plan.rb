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
    ExercisePlan.find_by(plan_id: plan.id, order: order + 1)
  end

  def no_of_sets
    trackers.count
  end

  def cardio_exercise?
    duration.positive? && set == 1
  end

  def duration_exercise?
    duration.positive? && set > 1
  end

  def self.exercise_status
    where(status: nil).first
  end

  def rest_in_mmss
    if rest < 61
      "00:#{rest.to_i}"
    else
      "0#{rest / 60}:#{rest % 60}"
    end
  end
end
