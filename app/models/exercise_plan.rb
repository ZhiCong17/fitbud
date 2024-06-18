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
    if rest < 10
      "00:0#{rest.to_i}"
    elsif rest < 60
      "00:#{rest.to_i}"
    elsif rest % 60 < 10
      "0#{(rest / 60).to_i}:0#{(rest % 60).to_i}"
    else
      "0#{(rest / 60).to_i}:#{(rest % 60).to_i}"
    end
  end

  def duration_in_mmss
    if duration < 60
      "00:#{duration.to_i}"
    elsif duration % 60 < 10 && duration > 599
      "#{duration / 60}:0#{duration % 60}"
    elsif duration % 60 < 10 && duration < 600
      "0#{duration / 60}:0#{duration % 60}"
    elsif duration > 599
      "#{duration / 60}:#{duration % 60}"
    else
      "0#{duration / 60}:#{duration % 60}"
    end
  end

  def current_exercise_plan?(plan)
    self == ExercisePlan.find_by(plan: plan, status: nil)
  end
end
