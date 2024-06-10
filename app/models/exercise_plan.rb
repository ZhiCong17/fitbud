class ExercisePlan < ApplicationRecord
  belongs_to :plan
  belongs_to :exercise
  has_many :trackers

  def complete_set?
    set == trackers.count
  end
end
