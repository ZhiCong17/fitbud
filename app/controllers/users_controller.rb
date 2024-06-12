class UsersController < ApplicationController
  def profile
    @user = current_user
    @bmi = @user.bmi(current_user) if @user.weight.present? && @user.height.present?
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    # user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: "Profile updated"
    else
      render :profile, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:age, :gender, :fitness_goal, :height, :weight)
  end
end
