class User < ApplicationRecord
  has_many :plans
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def current_plan
    plans.where("progress<100").first
  end

end
