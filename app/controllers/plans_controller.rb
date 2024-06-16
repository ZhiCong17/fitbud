require 'json'

class PlansController < ApplicationController
  def show
    @plan = Plan.find(params[:id])
    @exercise_plans = @plan.find
    @exercise_plans_by_day = @exercise_plans.group_by(&:suggested_day)
  end

  def create
    user = current_user

    respond_to do |format|
      format.js { render js: "showLoadingPage();" } # Show the loading page when the request starts
      format.html do
        result = Plan.check_and_handle_existing_plan(user)

        case result[:status]
        when :existing
          redirect_to plan_path(result[:plan]), alert: "Existing Plan still not completed"
        when :created
          redirect_to plan_path(result[:plan]), notice: "New Workout Plan created"
        else
          redirect_to root_path, alert: "Error creating plan"
        end
      end
    end
  end

  def plans_history
    @user = current_user
    @completed_plans = Plan.where(user_id: @user.id, progress: 100).order(created_at: :desc)
    # @completed_plans.each do |plan|
    #   @exercise_plan = plan
  end
end
