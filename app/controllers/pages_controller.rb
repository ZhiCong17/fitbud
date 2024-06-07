class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # raise
    # if user_signed_in?
    #   @user = current_user
    #   @plans = @user.plans
    #   @exercise_plans = @plan.exercise_plans
    #   @exercises = @exercise_plans.exercises
    # else
    #   render :home
    # end
  end
end
