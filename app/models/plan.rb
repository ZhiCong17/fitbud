class Plan < ApplicationRecord
  belongs_to :user
  has_many :exercise_plans
  has_many :exercises, through: :exercise_plans
end
