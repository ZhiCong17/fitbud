class User < ApplicationRecord
  has_many :plans
  GENDER = %w[Male Female].freeze
  FITNESS_GOAL = %w[gain-muscle loss-weight].freeze
  # AGE = %w[0..99].freeze
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :age, presence: true, numericality: { in: 0..99, message: 'must be in 0 to 99' }
  validates :height, :weight, presence: true
  validates :gender, presence: true, inclusion: { in: GENDER }
  validates :fitness_goal, presence: true, inclusion: { in: FITNESS_GOAL }

  def current_plan
    plans.where("progress<100").first
  end

  def bmi(user)
    @bmi = user.weight / ((user.height/100.0)**2)
  end
end
