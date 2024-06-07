class User < ApplicationRecord
  has_many :plans
  GENDER = %w[Male Female]
  FITNESS_GOAL = %w[gain-muscle loss-weight]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :age, :height, :weight, presence: true
  validates :gender, presence: true, inclusion: { in: GENDER }
  validates :fitness_goal, presence: true, inclusion: { in: FITNESS_GOAL }
end
