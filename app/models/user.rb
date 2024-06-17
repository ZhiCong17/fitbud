class User < ApplicationRecord
  has_many :plans
  GENDER = %w[Male Female].freeze
  # FITNESS_GOAL = %w[gain-muscle loss-weight].freeze
  FITNESS_GOAL = ["Gain muscle", "Gain strength", "Lose weight", "Gain endurance", "Recover from injury"].freeze
  # Fitness goal: "Gain muscle", "Gain strength", "Lose weight", "Gain endurance", "Recover from injury"

  # AGE = %w[0..99].freeze
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :age, presence: true, numericality: { in: 0..99, message: 'must be in 0 to 99' }, if: :persisted?
  validates :height, :weight, presence: true, if: :persisted?
  validates :gender, presence: true, inclusion: { in: GENDER }, if: :persisted?
  validates :fitness_goal, presence: true, inclusion: { in: FITNESS_GOAL }, if: :persisted?
  validates :username, presence: true, uniqueness: true, if: :persisted?

  def current_plan
    plans.where("progress<100").last
  end

  def bmi
    weight / ((height / 100.0)**2)
  end
end
